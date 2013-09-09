//
//  RMRTextGrid.h
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

@class RMR2DArray;

@interface RMRTextGrid : UIView {
    RMR2DArray* text;
    NSMutableArray* columnWidths;
}

@property (nonatomic) UIFont* font;
@property (nonatomic) double rowHeight;
@property (nonatomic) double defaultColumnWidth;

- (void)setText:(NSString*)text atRow:(int)row column:(int)col color:(UIColor*)color strokeColor:(UIColor*)stroke;
- (void)setColumn:(int)col width:(double)width;
- (void)clear;

@end
