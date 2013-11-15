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
    BOOL enabled;
}

@property (nonatomic) NSString* text;
@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic) NSString* detailText;
@property (nonatomic) UITableViewCellStyle style;
@property (nonatomic) UITableViewCellAccessoryType accessory;
@property (nonatomic) UIView* accessoryView;
@property (nonatomic,copy) BOOL(^selectBlock)(RMRSimpleTableViewItem* item);
@property (nonatomic,copy) BOOL(^deleteBlock)(RMRSimpleTableViewItem* item);
@property (nonatomic,copy) BOOL(^enabledBlock)(RMRSimpleTableViewItem* item);

- (id)initWithOwner:(RMRSimpleTableViewController*)owner group:(RMRSimpleTableViewGroup*)group;
- (void)configureCell:(UITableViewCell*)cell;
- (NSIndexPath*)indexPath;
- (UITableViewCell*)cell;
- (BOOL)enabled;
- (void)setEnabled:(BOOL)enabled;
- (void)updateEnabledState;

@end
