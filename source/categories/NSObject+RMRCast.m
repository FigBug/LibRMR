//
//  NSObject+RMRCast.m
//  SPIN Starts
//
//  Created by Roland Rabien on 2013-04-12.
//  Copyright (c) 2013 Sport Innovation Centre. All rights reserved.
//

#import "NSObject+RMRCast.h"

@implementation NSObject (RMRCast)

+ (instancetype)cast:(id)from
{
    if ([from isKindOfClass:self])
    {
        return from;
    }
    return nil;
}

@end
