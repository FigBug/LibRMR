//
//  RMRMainViewController.m
//  Demo
//
//  Created by Roland Rabien on 2013-09-06.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRMainViewController.h"
#import "RMRMapViewController.h"

@implementation RMRMainViewController

- (void)viewDidLoad
{
    self.title = @"LibRMR";
    
    [super viewDidLoad];
    
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setup
{
    RMRSimpleTableViewGroup* demosGrp = [self addGroup:@"Demos"];
    RMRSimpleTableViewItem* item;
    
    item = [self addItemToGroup:demosGrp text:@"Text Grid"];
    item.accessory = UITableViewCellAccessoryDisclosureIndicator;
    item.selectBlock = ^(RMRSimpleTableViewItem* item)
    {
        return NO;
    };
    
    item = [self addItemToGroup:demosGrp text:@"Map"];
    item.accessory = UITableViewCellAccessoryDisclosureIndicator;
    item.selectBlock = ^(RMRSimpleTableViewItem* item)
    {
        RMRMapViewController* vc = [[RMRMapViewController alloc] initWithNibName:@"RMRMapViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    };
    
}

@end
