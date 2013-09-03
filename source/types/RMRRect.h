//
//  RMRRect.h
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "RMRPoint.h"

@interface RMRRect : NSObject<NSCopying,NSCoding> {
    CGRect rc;
}

+ (RMRRect*)rectWithRect:(CGRect)rc;
+ (RMRRect*)rectWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

- (id)init;
- (id)initWithRect:(CGRect)rc;
- (id)initWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGRect)rect;
- (void)setRect:(CGRect)rc;

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

- (BOOL)containsPoint:(RMRPoint*)pt;
- (RMRPoint*)centerPoint;

@end