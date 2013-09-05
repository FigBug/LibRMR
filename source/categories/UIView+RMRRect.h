//
//  UIView+RMRRect.h
//  LibRMR
//
//  Created by Roland Rabien on 2013-09-03.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "../types/RMRRect.h"

@interface UIView (RMRRect)

- (RMRRect*)boundsRect;
- (void)setBoundsRect:(RMRRect*)rect;

- (RMRRect*)frameRect;
- (void)setFrameRect:(RMRRect*)rect;

@end
