//
//  RMRMainViewController.m
//  Demo
//
//  Created by Roland Rabien on 2013-09-06.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRMainViewController.h"

@implementation RMRMainViewController

- (void)viewDidLoad
{
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
    
    item = [self addItemToGroup:demosGrp text:@"Map"];
    
}

@end
