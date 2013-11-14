//
//  RMRSimpleTableViewItemCheck.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-13.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRSimpleTableViewItem.h"

@interface RMRSimpleTableViewItemSwitch : RMRSimpleTableViewItem

@property (nonatomic) NSString* setting;
@property (nonatomic) NSString* notification;
@property (nonatomic) UISwitch* uiSwitch;

@end
