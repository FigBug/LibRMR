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

@implementation RMRSimpleTableViewItemSlider

@synthesize setting;
@synthesize min;
@synthesize max;
@synthesize step;
@synthesize notification;

- (void)configureCell:(UITableViewCell*)cell
{
    [super configureCell:cell];
}

@end
