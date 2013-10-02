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

@implementation RMRSimpleTableViewItem

@synthesize text;
@synthesize detailText;
@synthesize style;
@synthesize accessory;
@synthesize selectBlock;

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
    }
    return self;
}

- (void)configureCell:(UITableViewCell*)cell
{
    cell.textLabel.text         = text;
    cell.detailTextLabel.text   = detailText;
    cell.accessoryType          = accessory;
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

@end
