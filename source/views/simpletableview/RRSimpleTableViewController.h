//
//  RRSimpleTableViewController.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RRSimpleTableViewGroup;
@class RRSimpleTableViewItem;

@interface RRSimpleTableViewController : UITableViewController {
    NSMutableArray* groups;
}

- (void)clear;

- (RRSimpleTableViewGroup*)addGroup;
- (RRSimpleTableViewGroup*)addGroup:(NSString*)name;

- (RRSimpleTableViewItem*)addItemToGroup:(RRSimpleTableViewGroup*)group text:(NSString*)text;
- (RRSimpleTableViewItem*)addItemToGroup:(RRSimpleTableViewGroup*)group text:(NSString*)text detailText:(NSString*)detailText;

- (void)reload;

@end
