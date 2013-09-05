//
//  RMRPair.h
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@interface RMRPair : NSObject<NSCopying,NSCoding> {
    id first;
    id second;
}

- (id)init;
- (id)initWithFirst:(id)first second:(id)second;

- (id)first;
- (id)second;

- (NSArray*)allValues;

@end
