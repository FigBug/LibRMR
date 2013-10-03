//
//  RMRRect.h
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRPoint.h"

@interface RMRRect : NSObject<NSCopying,NSCoding> {
    CGRect rc;
}

+ (RMRRect*)rectWithCGRect:(CGRect)rc;
+ (RMRRect*)rectWithCGPoint1:(CGPoint)p1 CGPoint2:(CGPoint)p2;
+ (RMRRect*)rectWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
+ (RMRRect*)rectWithCenter:(CGPoint)center width:(CGFloat)width height:(CGFloat)height;
+ (RMRRect*)nullRect;
+ (RMRRect*)emptyRect;

- (id)init;
- (id)initWithCGRect:(CGRect)rc;
- (id)initWithCGPoint1:(CGPoint)p1 CGPoint2:(CGPoint)p2;
- (id)initWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
- (id)initWithCenter:(CGPoint)center width:(CGFloat)width height:(CGFloat)height;

- (BOOL)isNull;
- (BOOL)isEmpty;
- (BOOL)isInfinite;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGRect)CGRect;
- (void)setCGRect:(CGRect)rc;

- (RMRPoint*)topLeft;
- (RMRPoint*)topRight;
- (RMRPoint*)bottomLeft;
- (RMRPoint*)bottomRight;

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)right;
- (CGFloat)bottom;

- (RMRRect*)intersctionWith:(RMRRect*)other;
- (RMRRect*)unionWith:(RMRRect*)other;

- (RMRRect*)insetX:(CGFloat)dx y:(CGFloat)dy;

- (BOOL)containsPoint:(RMRPoint*)pt;
- (RMRPoint*)centerPoint;

- (CGFloat)xAtPercent:(CGFloat)percent;
- (CGFloat)yAtPercent:(CGFloat)percent;

@end