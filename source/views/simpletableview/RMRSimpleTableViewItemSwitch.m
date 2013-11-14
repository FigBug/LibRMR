//
//  RMRSimpleTableViewItemCheck.m
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItemSwitch.h"
#import "RMRSimpleTableViewController.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRDefaults.h"

@implementation RMRSimpleTableViewItemSwitch

@synthesize setting;
@synthesize notification;
@synthesize uiSwitch;

- (void)configureCell:(UITableViewCell*)cell
{
    [super configureCell:cell];
    
    if (!uiSwitch)
    {
        uiSwitch = [[UISwitch alloc] init];
        [uiSwitch addTarget:self action:@selector(switched:) forControlEvents:UIControlEventValueChanged];
    }
    
    cell.accessoryView = uiSwitch;
    
    NSNumber* value = [RMRDefaults objectForKey:setting defaultValue:nil];
    if (value && value.boolValue)
        uiSwitch.on = YES;
    else
        uiSwitch.on = NO;
}

-(void)switched:(id)sender
{
    RMRDefaultsSetBoolForKey(setting, uiSwitch.on);
}

@end
