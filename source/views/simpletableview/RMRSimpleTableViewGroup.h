//
// RMRSimpleTableViewGroup.h
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RMRSimpleTableViewItem;
@class RMRSimpleTableViewItemCheck;
@class RMRSimpleTableViewItemSlider;
@class RMRSimpleTableViewItemDualSlider;
@class RMRSimpleTableViewItemSwitch;
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

- (RMRSimpleTableViewItemCheck*)addItemCheckText:(NSString*)name setting:(NSString*)setting value:(id)value;
- (RMRSimpleTableViewItemCheck*)addItemCheckText:(NSString*)name setting:(NSString*)setting value:(id)value notification:(NSString*)notification;

- (RMRSimpleTableViewItemSlider*)addItemSliderText:(NSString*)name settings:(NSString*)setting min:(double)min max:(double)max step:(double)step;
- (RMRSimpleTableViewItemSlider*)addItemSliderText:(NSString*)name settings:(NSString*)setting min:(double)min max:(double)max step:(double)step notification:(NSString*)notification;

- (RMRSimpleTableViewItemDualSlider*)addItemDualSliderText:(NSString*)name minSetting:(NSString*)minSetting maxSetting:(NSString*)maxSetting min:(double)min max:(double)max step:(double)step;
- (RMRSimpleTableViewItemDualSlider*)addItemDualSliderText:(NSString*)name minSetting:(NSString*)minSetting maxSetting:(NSString*)maxSetting min:(double)min max:(double)max step:(double)step notification:(NSString*)notification;

- (RMRSimpleTableViewItemSwitch*)addItemSwitch:(NSString*)name setting:(NSString*)setting;
- (RMRSimpleTableViewItemSwitch*)addItemSwitch:(NSString*)name setting:(NSString*)setting notification:(NSString*)notification;

- (BOOL)removeItem:(RMRSimpleTableViewItem*)item;

@end
