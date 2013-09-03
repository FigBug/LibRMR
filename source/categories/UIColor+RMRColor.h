//
//  UIColor+RMRColor.h
//
//  Created by Roland Rabien on 2012-10-26.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RMRColor)

- (UIColor*)lightenColorBy:(float)value;
- (UIColor *)darkenColorBy:(float)value;
- (BOOL)isLightColor;

@end
