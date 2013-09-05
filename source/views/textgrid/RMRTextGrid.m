//
//  RMRTextGrid.m
//  SPIN Starts
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRTextGrid.h"
#import "RMRTextItem.h"
#import "RMR2DArray.h"
#import "NSObject+RMRCast.h"

@implementation RMRTextGrid

@synthesize font;
@synthesize rowHeight;
@synthesize defaultColumnWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        text                = [[RMR2DArray alloc] init];
        font                = [UIFont boldSystemFontOfSize:19];
        rowHeight           = 20;
        defaultColumnWidth  = 100;
        columnWidths        = [[NSMutableArray alloc] init];
        self.opaque         = NO;
    }
    return self;
}

- (void)drawString:(NSString*)string at:(CGPoint)pnt on:(CGContextRef)ctx color:(CGColorRef)color stoke:(CGColorRef)stroke
{
    CGContextSetLineDash(ctx, 0, NULL, 0);
    CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
    CGContextSetLineWidth(ctx, 1.0);
    
    CGContextSetFillColorWithColor(ctx, color);
    CGContextSetStrokeColorWithColor(ctx, stroke);
    
    [string drawAtPoint:pnt withFont:font];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClipToRect(ctx, rect);

    for (int y = 0; y < text.rows; y++)
    {
        for (int x = 0; x < text.columns; x++)
        {
            RMRTextItem* itm = [RMRTextItem cast:[text objectAtRow:y column:x]];
            if (itm)
            {
                CGPoint pt = CGPointMake([self columnPosition:x], y * rowHeight);
                [self drawString:itm.text at:pt on:ctx color:itm.color.CGColor stoke:itm.strokeColor.CGColor];
            }
        }
    }
}

- (void)setText:(NSString*)str atX:(int)x y:(int)y color:(UIColor*)color strokeColor:(UIColor*)stroke
{
    RMRTextItem* itm = [[RMRTextItem alloc] init];
    itm.text        = str;
    itm.color       = color;
    itm.strokeColor = stroke;
    
    if (![itm isEqual:[text objectAtRow:y column:x]])
    {
        [text setObject:itm atRow:y column:x];
        
        [self setNeedsDisplayInRect:CGRectMake([self columnPosition: x], y * rowHeight, [self columnWidth:x], rowHeight + 3)];
    }
}

- (double)columnPosition:(int)col
{
    double pos = 0;
    
    for (int i = 0; i < col; i++)
        pos += [self columnWidth:i];

    return pos;
}

- (double)columnWidth:(int)col
{
    double width = defaultColumnWidth;
    if (col < columnWidths.count)
        width = [columnWidths[col] doubleValue];

    return width;
}

- (void)setColumn:(int)col width:(double)width
{
    while (columnWidths.count <= col)
        [columnWidths addObject:[NSNumber numberWithDouble:defaultColumnWidth]];
    
    [columnWidths replaceObjectAtIndex:col withObject:[NSNumber numberWithDouble:width]];
}

- (void)clear
{
    [text removeAllObjects];
    [self setNeedsDisplay];
}

@end
