
//
//  RMRPair.m
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRPair.h"

@implementation RMRPair

- (id)init
{
    return [self initWithFirst:nil second:nil];
}

- (id)initWithFirst:(id)first_ second:(id)second_
{
    self = [super init];
    if (self)
    {
        first   = first_;
        second  = second_;
    }
    return self;
}

- (id)first
{
    return first;
}

- (id)second
{
    return first;
}

@end
