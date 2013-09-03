//
//  RMRTextGrid.h
//  SPIN Starts
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMR2DArray.h"

@interface RMRTextGrid : UIView {
    RMR2DArray* text;
    NSMutableArray* columnWidths;
}

@property (nonatomic) UIFont* font;
@property (nonatomic) double rowHeight;
@property (nonatomic) double defaultColumnWidth;

- (void)setText:(NSString*)text atX:(int)x y:(int)y color:(UIColor*)col strokeColor:(UIColor*)stroke;
- (void)setColumn:(int)col width:(double)width;
- (void)clear;

@end
