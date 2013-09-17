//
//  RMRMapPath.m
//  Util
//
//  Created by Roland Rabien on 2013-08-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRMapPath.h"

@implementation RMRMapPath

@synthesize color;

- (id)init
{
    self = [super init];
    if (self)
    {
        color   = [UIColor redColor];
        points  = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray*)points
{
    @synchronized (points)
    {
        return [points copy];
    }
}

@end
