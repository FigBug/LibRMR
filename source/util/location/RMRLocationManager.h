//
//  RMRLocationManager.h
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@protocol RMRLocationWatcher;

@interface RMRLocationManager : NSObject<CLLocationManagerDelegate> {
    CLLocationManager* locationManager;
    NSMutableArray* watchers;
    BOOL enabled;
}

+ (RMRLocationManager*)sharedLocationManager;

- (void)addLocationWatcher:(id<RMRLocationWatcher>)watcher;
- (void)removeLocationWatcher:(id<RMRLocationWatcher>)watcher;

- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations;
- (void)locationManager:(CLLocationManager*)manager didFailWithError:(NSError*)error;
- (void)locationManager:(CLLocationManager*)manager didFinishDeferredUpdatesWithError:(NSError*)error;

@end
