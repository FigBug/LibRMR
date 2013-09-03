//
//  NSARMRay+RMRARMRay.m
//  SPIN Coach
//
//  Created by Roland Rabien on 2012-10-03.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import "NSARMRay+RMRARMRay.h"

@implementation NSARMRay (RMRARMRay)

- (id)firstObject
{
    if ([self count] > 0)
    {
        return [self objectAtIndex:0];
    }
    return nil;
}

@end
