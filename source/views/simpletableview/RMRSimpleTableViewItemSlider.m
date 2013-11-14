//
//  RMRSimpleTableViewItemCheck.m
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItemSlider.h"
#import "RMRSimpleTableViewController.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRDefaults.h"
#import "UIView+RMRRect.h"

@implementation RMRSimpleTableViewItemSlider

@synthesize slider;
@synthesize setting;
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
        slider = [[RMRLabelSlider alloc] init];
        
        [slider.slider addTarget:self action:@selector(slid:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
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
    
    NSNumber* value = [RMRDefaults objectForKey:setting defaultValue:nil];
    slider.value = value.doubleValue;
}

-(void)slid:(id)sender
{
    RMRDefaultsSetDoubleForKey(setting, slider.value);
    
    if (slidBlock)
        slidBlock(self);
    
    if (notification)
        [[NSNotificationCenter defaultCenter] postNotificationName:notification object:nil];
}

- (NSString*)textForValue:(RMRLabelSlider*)slider value:(float)value
{
    if (labelTextBlock)
        return labelTextBlock(self, value);
    return nil;
}

- (void)setEnabled:(BOOL)enabled_
{
    [super setEnabled:enabled_];
    
    slider.enabled = enabled_;
}

@end
