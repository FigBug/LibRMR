//
//  RMRSimpleTableViewItemCheck.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"
#import "views/sliders/RMRLabelRangeSlider.h"

@interface RMRSimpleTableViewItemDualSlider : RMRSimpleTableViewItem<RMRLabelRangeSliderDelegate>

@property (nonatomic) RMRLabelRangeSlider* slider;
@property (nonatomic) NSString* minSetting;
@property (nonatomic) NSString* maxSetting;
@property (nonatomic) double min;
@property (nonatomic) double max;
@property (nonatomic) double step;
@property (nonatomic) NSString* notification;
@property (nonatomic,copy) BOOL(^slidBlock)(RMRSimpleTableViewItem* item);
@property (nonatomic,copy) NSString*(^labelTextBlock)(RMRSimpleTableViewItemDualSlider* item, double lowerValue, double upperValue);

- (id)initWithOwner:(RMRSimpleTableViewController*)owner group:(RMRSimpleTableViewGroup*)group;

@end
