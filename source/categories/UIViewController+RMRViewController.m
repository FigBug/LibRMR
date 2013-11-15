//
//  UIViewController+RMRViewController.m
//  RMR
//
//  Created by Roland Rabien on 11/15/2013.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "UIViewController+RMRViewController.h"

@implementation UIViewController (RMRViewController)

- (void)setOpaqueNavBar
{
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion >= 7.0)
        self.navigationController.navigationBar.translucent = NO;
}

@end
