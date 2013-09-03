//
//  RRSimpleTableViewGroup.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RRSimpleTableViewItem;
@class RRSimpleTableViewController;

@interface RRSimpleTableViewGroup : NSObject {
    RRSimpleTableViewController* __weak owner;
    
    NSMutableArray* items;
}

@property (nonatomic) NSString* name;
@property (nonatomic,readonly) NSArray* items;

- (id)initWithOwner:(RRSimpleTableViewController*)owner name:(NSString*)name;

- (RRSimpleTableViewItem*)addItem;
- (RRSimpleTableViewItem*)addItemText:(NSString*)name;
- (RRSimpleTableViewItem*)addItemText:(NSString*)name detailText:(NSString*)detailText;

@end
