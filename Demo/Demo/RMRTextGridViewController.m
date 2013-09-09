//
//  RMRTextGridViewController.m
//  Demo
//
//  Created by Roland Rabien on 2013-09-09.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRTextGridViewController.h"

@implementation RMRTextGridViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"RMRTextGrid";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int row = 0; row < 20; row++)
    {
        for (int col = 0; col < 5; col++)
        {
            NSString* text = [NSString stringWithFormat:@"%c%d", col + 'A', row + 1];
            [textGrid setText:text atRow:row column:col color:[UIColor blackColor] strokeColor:[UIColor clearColor]];
        }
    }
    
    for (int i = 0; i < 5; i++)
        [textGrid setColumn:i width:textGrid.frameRect.width / 5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
