//
//  RMRTextItem.m
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRTextItem.h"
#import "NSObject+RMRCast.h"

@implementation RMRTextItem

@synthesize text;
@synthesize color;
@synthesize strokeColor;

- (BOOL)isEqual:(id)object
{
    RMRTextItem* other = [RMRTextItem cast:object];
    
    return other                                    &&
           [text isEqual:other.text]                &&
           [color isEqual:other.color]              &&
           [strokeColor isEqual:other.strokeColor];
}

@end
