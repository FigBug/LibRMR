//
//  RRSimpleTableViewItem.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RRSimpleTableViewController;
@class RRSimpleTableViewGroup;

@interface RRSimpleTableViewItem : NSObject {
    RRSimpleTableViewGroup* __weak group;
    RRSimpleTableViewController* __weak owner;
}

@property (nonatomic) NSString* text;
@property (nonatomic) NSString* detailText;
@property (nonatomic) UITableViewCellStyle style;

- (id)initWithOwner:(RRSimpleTableViewController*)owner group:(RRSimpleTableViewGroup*)group;
- (void)configureCell:(UITableViewCell*)cell;

@end
