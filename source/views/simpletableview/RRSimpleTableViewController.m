//
//  RRSimpleTableViewController.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RRSimpleTableViewController.h"
#import "RRSimpleTableViewGroup.h"
#import "RRSimpleTableViewItem.h"

@interface RRSimpleTableViewController ()

@end

@implementation RRSimpleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        groups = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return groups.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    RRSimpleTableViewGroup* group = [groups objectAtIndex:section];
    return group.items.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    RRSimpleTableViewGroup* group = [groups objectAtIndex:indexPath.section];
    RRSimpleTableViewItem* item   = [group.items objectAtIndex:indexPath.item];

    static NSString* ident = nil;
    switch (item.style)
    {
        case UITableViewCellStyleDefault:   ident = @"cellDefault";     break;
        case UITableViewCellStyleValue1:    ident = @"cellValue1";      break;
        case UITableViewCellStyleValue2:    ident = @"cellValue2";      break;
        case UITableViewCellStyleSubtitle:  ident = @"cellSubtitle";    break;
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ident];    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:item.style reuseIdentifier:ident];

    
    [item configureCell:cell];
        
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    RRSimpleTableViewGroup* group = [groups objectAtIndex:section];
    return group.name;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self.tableView reloadData];
}

#pragma mark - User functions

- (void)reload
{
    [self.tableView reloadData];
}

- (void)clear
{
    [groups removeAllObjects];
    
    [self.tableView reloadData];
}

- (RRSimpleTableViewGroup*)addGroup
{
    return [self addGroup:nil];
}

- (RRSimpleTableViewGroup*)addGroup:(NSString*)name
{
    RRSimpleTableViewGroup* group = [[RRSimpleTableViewGroup alloc] initWithOwner:self name:name];
    [groups addObject:group];
    
    [self.tableView reloadData];
    
    return group;
}

- (RRSimpleTableViewItem*)addItemToGroup:(RRSimpleTableViewGroup*)group text:(NSString*)text
{
    return [self addItemToGroup:group text:text detailText:nil];
}

- (RRSimpleTableViewItem*)addItemToGroup:(RRSimpleTableViewGroup*)group text:(NSString*)text detailText:(NSString*)detailText
{
    RRSimpleTableViewItem* item = [group addItem];
    item.text       = text;
    item.detailText = detailText;
    
    [self.tableView reloadData];
    
    return item;
}


@end
