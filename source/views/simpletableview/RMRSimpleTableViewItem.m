//
// RMRSimpleTableViewItem.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRSimpleTableViewController.h"
#import "NSObject+RMRCast.h"

@implementation RMRSimpleTableViewItem

@synthesize text;
@synthesize detailText;
@synthesize style;
@synthesize accessory;
@synthesize accessoryView;
@synthesize selectBlock;
@synthesize deleteBlock;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner_ group:(RMRSimpleTableViewGroup*)group_;
{
    self = [super init];
    if (self)
    {
        owner       = owner_;
        group       = group_;
        
        text        = nil;
        detailText  = nil;
        style       = UITableViewCellStyleSubtitle;
        accessory   = UITableViewCellAccessoryNone;
        enabled     = YES;
    }
    return self;
}

- (void)configureCell:(UITableViewCell*)cell
{
    cell.textLabel.text             = text;
    cell.textLabel.enabled          = enabled;
    
    cell.detailTextLabel.text       = detailText;
    cell.detailTextLabel.enabled    = enabled;
    
    if (accessoryView)
    {
        cell.accessoryType      = UITableViewCellAccessoryNone;
        cell.accessoryView      = accessoryView;
        
        UIControl* control = [UIControl cast:cell.accessoryView];
        if (control)
            control.enabled = enabled;
    }
    else
    {
        cell.accessoryView      = nil;
        cell.accessoryType      = accessory;
    }
}

- (NSIndexPath*)indexPath
{
    int item    = [group.items indexOfObject:self];
    int section = [owner.groups indexOfObject:group];
    
    return [NSIndexPath indexPathForItem:item inSection:section];
}

- (UITableViewCell*)cell
{
    return [owner.tableView cellForRowAtIndexPath:[self indexPath]];
}

- (BOOL)enabled
{
    return enabled;
}

- (void)setEnabled:(BOOL)enabled_
{
    enabled = enabled_;
    
    UITableViewCell* cell = [self cell];
    if (cell)
    {
        cell.textLabel.enabled          = enabled;
        cell.detailTextLabel.enabled    = enabled;
        
        if (accessoryView)
        {
            UIControl* control = [UIControl cast:cell.accessoryView];
            if (control)
                control.enabled = enabled;
        }
    }
}

@end
