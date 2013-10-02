//
//  RMRSimpleTableViewController.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewController.h"
#import "RMRSimpleTableViewGroup.h"
#import "RMRSimpleTableViewItem.h"

@implementation RMRSimpleTableViewController

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
    RMRSimpleTableViewGroup* group = [groups objectAtIndex:section];
    return group.items.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    RMRSimpleTableViewGroup* group = [groups objectAtIndex:indexPath.section];
    RMRSimpleTableViewItem* item   = [group.items objectAtIndex:indexPath.item];

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
    RMRSimpleTableViewGroup* group = [groups objectAtIndex:section];
    return group.name;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    RMRSimpleTableViewGroup* group = [groups objectAtIndex:indexPath.section];
    RMRSimpleTableViewItem* item   = [group.items objectAtIndex:indexPath.item];

    if ([item respondsToSelector:@selector(didSelectRow)])
    {
        [item didSelectRow];
    }
    if (item.selectBlock)
    {
        if (!item.selectBlock(item))
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
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

- (NSArray*)groups
{
    return [groups copy];
}

- (RMRSimpleTableViewGroup*)addGroup
{
    return [self addGroup:nil];
}

- (RMRSimpleTableViewGroup*)addGroup:(NSString*)name
{
    RMRSimpleTableViewGroup* group = [[RMRSimpleTableViewGroup alloc] initWithOwner:self name:name];
    [groups addObject:group];
    
    [self.tableView reloadData];
    
    return group;
}

@end
