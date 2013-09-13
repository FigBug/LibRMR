//
// RMRSimpleTableViewGroup.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewGroup.h"
#import "RMRSimpleTableViewItem.h"
#import "RMRSimpleTableViewItemCheck.h"
#import "RMRSimpleTableViewController.h"

@implementation RMRSimpleTableViewGroup

@synthesize name;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner_ name:(NSString*)name_
{
    self = [super init];
    if (self)
    {
        owner   = owner_;
        items   = [[NSMutableArray alloc] init];
        name    = name_;
    }
    return self;
}

- (NSArray*)items
{
    return [items copy];
}

- (RMRSimpleTableViewItem*)addItem
{
    return [self addItemText:nil detailText:nil];
}

- (RMRSimpleTableViewItem*)addItemText:(NSString*)text
{
    return [self addItemText:text detailText:nil];
}

- (RMRSimpleTableViewItem*)addItemText:(NSString*)text detailText:(NSString*)detailText
{
    RMRSimpleTableViewItem* item = [[RMRSimpleTableViewItem alloc] initWithOwner:owner group:self];
    item.text       = text;
    item.detailText = detailText;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

- (RMRSimpleTableViewItem*)addItemCheckText:(NSString*)text setting:(NSString*)setting value:(id)value
{
    RMRSimpleTableViewItemCheck* item = [[RMRSimpleTableViewItemCheck alloc] initWithOwner:owner group:self];
    item.text       = text;
    item.detailText = nil;
    item.setting    = setting;
    item.value      = value;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;

}

@end
