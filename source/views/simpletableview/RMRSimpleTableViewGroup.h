//
// RMRSimpleTableViewGroup.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RMRSimpleTableViewItem;
@class RMRSimpleTableViewController;

@interface RMRSimpleTableViewGroup : NSObject {
    RMRSimpleTableViewController* __weak owner;
    
    NSMutableArray* items;
}

@property (nonatomic) NSString* name;
@property (nonatomic,readonly) NSArray* items;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner name:(NSString*)name;

- (RMRSimpleTableViewItem*)addItem;
- (RMRSimpleTableViewItem*)addItemText:(NSString*)name;
- (RMRSimpleTableViewItem*)addItemText:(NSString*)name detailText:(NSString*)detailText;

- (RMRSimpleTableViewItem*)addItemCheckText:(NSString*)name setting:(NSString*)setting value:(id)value;
- (RMRSimpleTableViewItem*)addItemCheckText:(NSString*)name setting:(NSString*)setting value:(id)value notification:(NSString*)notification;

- (RMRSimpleTableViewItem*)addItemSliderText:(NSString*)name settings:(NSString*)setting min:(double)min max:(double)max step:(double)step;
- (RMRSimpleTableViewItem*)addItemDualSliderText:(NSString*)name minSetting:(NSString*)minSetting maxSetting:(NSString*)maxSetting min:(double)min max:(double)max step:(double)step;
- (RMRSimpleTableViewItem*)addItemSwitch:(NSString*)name setting:(NSString*)setting;

- (BOOL)removeItem:(RMRSimpleTableViewItem*)item;

@end
