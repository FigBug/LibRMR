//
//  UIView+RMRRect.m
//  LibRMR
//
//  Created by Roland Rabien on 2013-09-03.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "UIView+RMRRect.h"

@implementation UIView (RMRRect)

- (RMRRect*)boundsRect
{
    return [RMRRect rectWithCGRect:self.bounds];
}

- (void)setBoundsRect:(RMRRect*)rect
{
    self.bounds = rect.CGRect;
}

- (RMRRect*)frameRect
{
    return [RMRRect rectWithCGRect:self.frame];
}

- (void)setFrameRect:(RMRRect*)rect
{
    self.frame = rect.CGRect;
}

@end
