//
//  RMRLine.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMRPoint.h"

@interface RMRLine : NSObject<NSCopying,NSCoding> {
    CGPoint pt1;
    CGPoint pt2;
}

- (id)initFrom:(RMRPoint*)pt1 to:(RMRPoint*)pt2;

- (double)length;

- (RMRPoint*)pt1;
- (RMRPoint*)pt2;

- (double)angle;

- (double)dx;
- (double)dy;

- (BOOL)solveForM:(double*)m b:(double*)b;

- (double)xAtY:(double)y;
- (double)yAtX:(double)x;

@end
