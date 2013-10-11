//
//  RMRSimpleTableViewItemCheck.m
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItemCheck.h"
#import "RMRSimpleTableViewController.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRDefaults.h"

@implementation RMRSimpleTableViewItemCheck

@synthesize setting;
@synthesize value;
@synthesize notification;

- (void)configureCell:(UITableViewCell*)cell
{
    [super configureCell:cell];
    
    if ([[RMRDefaults objectForKey:setting defaultValue:nil] isEqual:value])
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
}

- (void)didSelectRow
{
    for (id item in group.items)
    {
        if ([item isKindOfClass:[RMRSimpleTableViewItemCheck class]])
        {
            RMRSimpleTableViewItemCheck* itemCheck = (RMRSimpleTableViewItemCheck*)item;
            if ([itemCheck.setting isEqual:setting] && itemCheck != self)
            {
                UITableViewCell* cell = [itemCheck cell];
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    
    [RMRDefaults setObject:value forKey:setting];
    
    UITableViewCell* cell = [self cell];
    if (cell)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notification object:nil];
    
    [owner.tableView deselectRowAtIndexPath:[self indexPath] animated:YES];
}

@end
