//
//  RMRSimpleTableViewItemCheck.m
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItemDualSlider.h"
#import "RMRSimpleTableViewController.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRDefaults.h"
#import "NMRangeSlider.h"
#import "UIView+RMRRect.h"

@implementation RMRSimpleTableViewItemDualSlider

@synthesize slider;
@synthesize minSetting;
@synthesize maxSetting;
@synthesize min;
@synthesize max;
@synthesize step;
@synthesize notification;
@synthesize slidBlock;
@synthesize labelTextBlock;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner_ group:(RMRSimpleTableViewGroup*)group_
{
    self = [super initWithOwner:owner_ group:group_];
    if (self)
    {
        slider = [[RMRLabelRangeSlider alloc] init];
        
        [slider.slider addTarget:self action:@selector(slid:) forControlEvents:UIControlEventValueChanged];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:NULL];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)configureCell:(UITableViewCell*)cell
{
    UITableView* table = owner.tableView;
    slider.bounds = CGRectMake(0, 0, owner.tableView.boundsRect.width * 2.0/3.0, table.rowHeight);

    slider.minimumValue = min;
    slider.maximumValue = max;
    slider.stepSize     = step;
    slider.delegate     = self;

    self.accessoryView = slider;
    
    [super configureCell:cell];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (minSetting && maxSetting)
    {
        NSNumber* minValue = [RMRDefaults objectForKey:minSetting defaultValue:nil];
        NSNumber* maxValue = [RMRDefaults objectForKey:maxSetting defaultValue:nil];
        
        slider.lowerValue = minValue.doubleValue;
        slider.upperValue = maxValue.doubleValue;
    }
}

-(void)slid:(id)sender
{
    if (minSetting && maxSetting)
    {
        RMRDefaultsSetDoubleForKey(minSetting, slider.lowerValue);
        RMRDefaultsSetDoubleForKey(maxSetting, slider.upperValue);
    }
    
    if (slidBlock)
        slidBlock(self);
    
    if (notification)
        [[NSNotificationCenter defaultCenter] postNotificationName:notification object:nil];
}

- (NSString*)textForValue:(RMRLabelRangeSlider *)slider lower:(float)v1 upper:(float)v2
{
    if (labelTextBlock)
        return labelTextBlock(self, v1, v2);
    return nil;
}

- (void)setEnabled:(BOOL)enabled_
{
    [super setEnabled:enabled_];
    
    slider.enabled = enabled_;
}

- (void)orientationDidChange:(NSNotification*)notification
{
    UITableView* table = owner.tableView;
    slider.bounds = CGRectMake(0, 0, owner.tableView.boundsRect.height * 2.0/3.0, table.rowHeight);
}

@end
