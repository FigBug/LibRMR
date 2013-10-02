//
// RMRSimpleTableViewController.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RMRSimpleTableViewGroup;
@class RMRSimpleTableViewItem;

@interface RMRSimpleTableViewController : UITableViewController {
    NSMutableArray* groups;
}

- (void)clear;

- (NSArray*)groups;

- (RMRSimpleTableViewGroup*)addGroup;
- (RMRSimpleTableViewGroup*)addGroup:(NSString*)name;

- (void)reload;

@end
