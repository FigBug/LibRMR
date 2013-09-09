//
//  RMRMapViewController.m
//  Demo
//
//  Created by Roland Rabien on 2013-09-06.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRMapViewController.h"

@interface RMRMapViewController ()

@end

@implementation RMRMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"RMRMapView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [map setZoomLevel:14];
    [map setCenterCoordinate:RMRMapCoordinateMake(48.4222,-123.3657)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
