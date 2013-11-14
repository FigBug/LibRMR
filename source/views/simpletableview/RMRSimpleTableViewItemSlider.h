//
//  RMRSimpleTableViewItemCheck.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"
#import "views/sliders/RMRLabelSlider.h"

@interface RMRSimpleTableViewItemSlider : RMRSimpleTableViewItem<RMRLabelSliderDelegate>

@property (nonatomic) RMRLabelSlider* slider;
@property (nonatomic) NSString* setting;
@property (nonatomic) double min;
@property (nonatomic) double max;
@property (nonatomic) double step;
@property (nonatomic) NSString* notification;
@property (nonatomic,copy) BOOL(^slidBlock)(RMRSimpleTableViewItem* item);
@property (nonatomic,copy) NSString*(^labelTextBlock)(RMRSimpleTableViewItemSlider* item, double value);

- (id)initWithOwner:(RMRSimpleTableViewController*)owner group:(RMRSimpleTableViewGroup*)group;

@end
