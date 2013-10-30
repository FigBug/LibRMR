//
// RMRSimpleTableViewItem.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//
#import "RMRSimpleTableViewItemProtocol.h"

@class RMRSimpleTableViewController;
@class RMRSimpleTableViewGroup;

@interface RMRSimpleTableViewItem : NSObject<RMRSimpleTableViewItemProtocol> {
    RMRSimpleTableViewGroup* __weak group;
    RMRSimpleTableViewController* __weak owner;
}

@property (nonatomic) NSString* text;
@property (nonatomic) NSString* detailText;
@property (nonatomic) UITableViewCellStyle style;
@property (nonatomic) UITableViewCellAccessoryType accessory;
@property (nonatomic,copy) BOOL(^selectBlock)(RMRSimpleTableViewItem* item);
@property (nonatomic,copy) BOOL(^deleteBlock)(RMRSimpleTableViewItem* item);

- (id)initWithOwner:(RMRSimpleTableViewController*)owner group:(RMRSimpleTableViewGroup*)group;
- (void)configureCell:(UITableViewCell*)cell;
- (NSIndexPath*)indexPath;
- (UITableViewCell*)cell;

@end
