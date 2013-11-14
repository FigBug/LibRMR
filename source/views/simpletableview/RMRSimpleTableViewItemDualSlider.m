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

@implementation RMRSimpleTableViewItemDualSlider

@synthesize minSetting;
@synthesize maxSetting;
@synthesize min;
@synthesize max;
@synthesize step;
@synthesize notification;

- (void)configureCell:(UITableViewCell*)cell
{
    [super configureCell:cell];
}

@end
