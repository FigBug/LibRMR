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
@synthesize switchedBlock;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner_ group:(RMRSimpleTableViewGroup*)group_
{
    self = [super initWithOwner:owner_ group:group_];
    if (self)
    {
        uiSwitch = [[UISwitch alloc] init];
        [uiSwitch addTarget:self action:@selector(switched:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)configureCell:(UITableViewCell*)cell
{
    self.accessoryView = uiSwitch;
    
    [super configureCell:cell];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSNumber* value = [RMRDefaults objectForKey:setting defaultValue:nil];
    if (value && value.boolValue)
        uiSwitch.on = YES;
    else
        uiSwitch.on = NO;
}

-(void)switched:(id)sender
{
    RMRDefaultsSetBoolForKey(setting, uiSwitch.on);
    
    if (switchedBlock)
        switchedBlock(self, uiSwitch.on);
    
    if (notification)
        [[NSNotificationCenter defaultCenter] postNotificationName:notification object:nil];
}

@end
