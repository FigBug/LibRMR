//
//  UIColor+RMRColor.h
//
//  Created by Roland Rabien on 2012-10-26.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RMRColor)

+ (UIColor*)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;
- (UIColor*)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

- (BOOL)getHue:(CGFloat*)hue saturation:(CGFloat*)saturation lightness:(CGFloat*)lightness alpha:(CGFloat*)alpha;

- (UIColor*)lightenColorBy:(float)value;
- (UIColor*)darkenColorBy:(float)value;

- (UIColor*)goldenRatioColor:(int)idx;

- (BOOL)isLightColor;



@end
