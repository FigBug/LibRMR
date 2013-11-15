//
//  RMRDemoSimpleTableViewController.m
//  Demo
//
//  Created by Roland Rabien on 2013-11-15.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRDemoSimpleTableViewController.h"

@interface RMRDemoSimpleTableViewController ()

@end

@implementation RMRDemoSimpleTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

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
    [self clear];
    
    RMRSimpleTableViewGroup* group;
    RMRSimpleTableViewItem* item;
    
    group = [self addGroup:@"Controls"];
    
    [group addItemText:@"Text" detailText:@"Detail"];
    [group addItemSwitchText:@"Switch" setting:nil];
    [group addItemSliderText:@"Slider" settings:nil min:0 max:10 step:0.5];
    [group addItemSliderText:@"Dual Slider" settings:nil min:0 max:20 step:0.2];
    [group addItemCheckText:@"Check 1" setting:nil value:@0];
    [group addItemCheckText:@"Check 2" setting:nil value:@1];
    
    group = [self addGroup:@"Styles"];
    [group addItemText:@"UITableViewCellStyleDefault" detailText:@"detail text" style:UITableViewCellStyleDefault];
    [group addItemText:@"UITableViewCellStyleValue1" detailText:@"detail text" style:UITableViewCellStyleValue1];
    [group addItemText:@"UITableViewCellStyleValue2" detailText:@"detail text" style:UITableViewCellStyleValue2];
    [group addItemText:@"UITableViewCellStyleSubtitle" detailText:@"detail text" style:UITableViewCellStyleSubtitle];
}

@end
