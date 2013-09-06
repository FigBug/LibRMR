//
//  RRSimpleTableViewItem.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"

@implementation RMRSimpleTableViewItem

@synthesize text;
@synthesize detailText;
@synthesize style;

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
    }
    return self;
}

- (void)configureCell:(UITableViewCell*)cell
{
    cell.textLabel.text         = text;
    cell.detailTextLabel.text   = detailText;
}

@end
