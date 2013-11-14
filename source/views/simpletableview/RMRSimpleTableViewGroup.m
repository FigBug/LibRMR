//
// RMRSimpleTableViewGroup.m
//  Util
//
//  Created by Roland Rabien on 2013-08-02.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewGroup.h"
#import "RMRSimpleTableViewItem.h"
#import "RMRSimpleTableViewItemCheck.h"
#import "RMRSimpleTableViewItemSlider.h"
#import "RMRSimpleTableViewItemDualSlider.h"
#import "RMRSimpleTableViewItemSwitch.h"
#import "RMRSimpleTableViewController.h"

@implementation RMRSimpleTableViewGroup

@synthesize name;

- (id)initWithOwner:(RMRSimpleTableViewController*)owner_ name:(NSString*)name_
{
    self = [super init];
    if (self)
    {
        owner   = owner_;
        items   = [[NSMutableArray alloc] init];
        name    = name_;
    }
    return self;
}

- (NSArray*)items
{
    return [items copy];
}

- (RMRSimpleTableViewItem*)addItem
{
    return [self addItemText:nil detailText:nil];
}

- (RMRSimpleTableViewItem*)addItemText:(NSString*)text
{
    return [self addItemText:text detailText:nil];
}

- (RMRSimpleTableViewItem*)addItemText:(NSString*)text detailText:(NSString*)detailText
{
    RMRSimpleTableViewItem* item = [[RMRSimpleTableViewItem alloc] initWithOwner:owner group:self];
    item.text       = text;
    item.detailText = detailText;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

- (RMRSimpleTableViewItem*)addItemCheckText:(NSString*)text setting:(NSString*)setting value:(id)value
{
    return [self addItemCheckText:text setting:setting value:value notification:nil];
}

- (RMRSimpleTableViewItem*)addItemCheckText:(NSString*)text setting:(NSString*)setting value:(id)value notification:(NSString*)notification
{
    RMRSimpleTableViewItemCheck* item = [[RMRSimpleTableViewItemCheck alloc] initWithOwner:owner group:self];
    item.text           = text;
    item.detailText     = nil;
    item.setting        = setting;
    item.value          = value;
    item.notification   = notification;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

- (RMRSimpleTableViewItem*)addItemSliderText:(NSString*)text settings:(NSString*)setting min:(double)min max:(double)max step:(double)step
{
    RMRSimpleTableViewItemSlider* item = [[RMRSimpleTableViewItemSlider alloc] initWithOwner:owner group:self];
    item.text           = text;
    item.detailText     = nil;
    item.setting        = setting;
    item.min            = min;
    item.max            = max;
    item.step           = step;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

- (RMRSimpleTableViewItem*)addItemDualSliderText:(NSString*)text minSetting:(NSString*)minSetting maxSetting:(NSString*)maxSetting min:(double)min max:(double)max step:(double)step
{
    RMRSimpleTableViewItemDualSlider* item = [[RMRSimpleTableViewItemDualSlider alloc] initWithOwner:owner group:self];
    item.text           = text;
    item.detailText     = nil;
    item.minSetting     = minSetting;
    item.maxSetting     = maxSetting;
    item.min            = min;
    item.max            = max;
    item.step           = step;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;
}

- (RMRSimpleTableViewItem*)addItemSwitch:(NSString*)text setting:(NSString*)setting
{
    RMRSimpleTableViewItemSwitch* item = [[RMRSimpleTableViewItemSwitch alloc] initWithOwner:owner group:self];
    item.text           = text;
    item.detailText     = nil;
    item.setting        = setting;
    
    [items addObject:item];
    
    [owner reload];
    
    return item;

}

- (BOOL)removeItem:(RMRSimpleTableViewItem*)item
{
    if ([items containsObject:item])
    {
        [items removeObject:item];
        return YES;
    }
    return NO;
}

@end
