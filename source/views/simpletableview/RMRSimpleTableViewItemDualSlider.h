//
//  RMRSimpleTableViewItemCheck.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"

@interface RMRSimpleTableViewItemDualSlider : RMRSimpleTableViewItem

@property (nonatomic) NSString* minSetting;
@property (nonatomic) NSString* maxSetting;
@property (nonatomic) double min;
@property (nonatomic) double max;
@property (nonatomic) double step;
@property (nonatomic) NSString* notification;

@end
