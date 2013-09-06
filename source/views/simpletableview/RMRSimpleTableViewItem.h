//
//  RRSimpleTableViewItem.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RMRSimpleTableViewController;
@class RMRSimpleTableViewGroup;

@interface RMRSimpleTableViewItem : NSObject {
    RMRSimpleTableViewGroup* __weak group;
    RMRSimpleTableViewController* __weak owner;
}

@property (nonatomic) NSString* text;
@property (nonatomic) NSString* detailText;
@property (nonatomic) UITableViewCellStyle style;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner group:(RMRSimpleTableViewGroup*)group;
- (void)configureCell:(UITableViewCell*)cell;

@end
