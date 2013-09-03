//
//  RRSimpleTableViewGroup.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RRSimpleTableViewGroup.h"
#import "RRSimpleTableViewItem.h"
#import "RRSimpleTableViewController.h"

@implementation RRSimpleTableViewGroup

@synthesize name;

- (id)initWithOwner:(RRSimpleTableViewController*)owner_ name:(NSString*)name_
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

- (RRSimpleTableViewItem*)addItem
{
    return [self addItemText:nil detailText:nil];
}

- (RRSimpleTableViewItem*)addItemText:(NSString*)text
{
    return [self addItemText:text detailText:nil];
}

- (RRSimpleTableViewItem*)addItemText:(NSString*)text detailText:(NSString*)detailText
{
    RRSimpleTableViewItem* item = [[RRSimpleTableViewItem alloc] initWithOwner:owner group:self];
    item.text       = text;
    item.detailText = detailText;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

@end
