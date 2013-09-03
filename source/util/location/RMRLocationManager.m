//
//  RMRLocationManager.m
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRLocationManager.h"
#import "RMRLocationWatcher.h"

@implementation RMRLocationManager

+ (RMRLocationManager*)sharedLocationManager
{
    static RMRLocationManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RMRLocationManager alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        enabled  = NO;
        watchers = [[NSMutableArray alloc] init];

        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
    }
    return self;
}

- (CLLocationAccuracy)accuracyRequired
{
    CLLocationAccuracy req = kCLLocationAccuracyHundredMeters;
    
    for (id<RMRLocationWatcher> watcher in watchers)
    {
        if ([watcher respondsToSelector:@selector(accuracyRequired)])
        {
            CLLocationAccuracy r = [watcher accuracyRequired];
            if (r < req)
                req = r;
        }
    }
    return req;
}

- (void)addLocationWatcher:(id<RMRLocationWatcher>)watcher
{
    [watchers addObject:watcher];
    
    if (watchers.count == 1)
    {
        CLAuthorizationStatus status = [CLLocationManager authorizationStatus];

        if (status == kCLAuthorizationStatusAuthorized      ||
            status == kCLAuthorizationStatusNotDetermined)
        {
            [locationManager startUpdatingLocation];
            locationManager.pausesLocationUpdatesAutomatically = NO;
            locationManager.distanceFilter  = kCLDistanceFilterNone;
            locationManager.desiredAccuracy = [self accuracyRequired];
            locationManager.activityType    = CLActivityTypeFitness;
            
            enabled = YES;
        }
    }
}

- (void)removeLocationWatcher:(id<RMRLocationWatcher>)watcher
{
    [watchers removeObject:watcher];
    
    if (enabled && watchers.count == 0)
    {
        [locationManager stopUpdatingLocation];
        enabled = NO;
    }
}

- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations
{
    for (id<RMRLocationWatcher> watcher in watchers)
    {
        for (CLLocation* location in locations)
            [watcher locationUpdated:location];
    }
}

- (void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError*)error
{
    for (id<RMRLocationWatcher> watcher in watchers)
    {
        [watcher locationUpdated:nil];
    }
}

- (void)locationManager:(CLLocationManager*)manager didFinishDeferredUpdatesWithError:(NSError*)error
{
}

@end
