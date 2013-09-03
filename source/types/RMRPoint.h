//
//  RMRPoint.h
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface RMRPoint : NSObject<NSCopying,NSCoding> {
    CGPoint pt;
}

+ (RMRPoint*)pointWithCGPoint:(CGPoint)pt;
+ (RMRPoint*)pointWithX:(CGFloat)x y:(CGFloat)y;

- (id)init;
- (id)initWithCGPoint:(CGPoint)pt;
- (id)initWithX:(CGFloat)x y:(CGFloat)y;

- (CGFloat)x;
- (void)setX:(CGFloat)x;

- (CGFloat)y;
- (void)setY:(CGFloat)y;

- (CGPoint)CGPoint;
- (void)setCGPoint:(CGPoint)pt;

- (void)translateX:(CGFloat)x y:(CGFloat)y;
- (RMRPoint*)pointByTranslatingX:(CGFloat)x y:(CGFloat)y;

@end
