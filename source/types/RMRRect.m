
//
//  RMRPoint.m
//
//  Created by Roland Rabien on 2013-08-27.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRRect.h"

#define kVersion    @"version"
#define kRect       @"rect"

@implementation RMRRect

+ (RMRRect*)rectWithCGRect:(CGRect)rc
{
    return [[RMRRect alloc] initWithCGRect:rc];
}

+ (RMRRect*)rectWithCGPoint1:(CGPoint)p1 CGPoint2:(CGPoint)p2
{
    return [[RMRRect alloc] initWithCGPoint1:p1 CGPoint2:p2];
}

+ (RMRRect*)rectWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    return [[RMRRect alloc] initWithX:x y:y width:width height:height];
}

+ (RMRRect*)nullRect
{
    return [[RMRRect alloc] initWithCGRect:CGRectNull];
}

+ (RMRRect*)emptyRect
{
    return [[RMRRect alloc] init];
}

- (id)init
{
    return [self initWithCGRect:CGRectMake(0, 0, 0, 0)];
}

- (id)initWithCGRect:(CGRect)rc_
{
    self = [super init];
    if (self)
    {
        rc = CGRectStandardize(rc_);
    }
    return self;
}

- (id)initWithCGPoint1:(CGPoint)p1 CGPoint2:(CGPoint)p2
{
    return [self initWithCGRect:CGRectMake(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y)];
}

- (id)initWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    return [self initWithCGRect:CGRectMake(x, y, width, height)];
}

- (BOOL)isNull
{
    return CGRectIsNull(rc);
}

- (BOOL)isEmpty
{
    return CGRectIsEmpty(rc);
}

- (BOOL)isInfinite
{
    return CGRectIsInfinite(rc);
}

- (CGFloat)x
{
    return rc.origin.x;
}

- (void)setX:(CGFloat)x
{
    rc.origin.x = x;
}

- (CGFloat)y
{
    return rc.origin.y;
}

- (void)setY:(CGFloat)y
{
    rc.origin.y = y;
}

- (CGFloat)width
{
    return rc.size.width;
}

- (void)setWidth:(CGFloat)width
{
    rc.size.width = width;
    rc = CGRectStandardize(rc);
}

- (CGFloat)height
{
    return rc.size.height;
}

- (void)setHeight:(CGFloat)height
{
    rc.size.height = height;
    rc = CGRectStandardize(rc);
}

- (CGRect)CGRect
{
    return rc;
}

- (void)setCGRect:(CGRect)rc_
{
    rc = CGRectStandardize(rc_);
}

- (RMRPoint*)topLeft
{
    return [RMRPoint pointWithX:self.left y:self.top];
}

- (RMRPoint*)topRight
{
    return [RMRPoint pointWithX:self.right y:self.top];
}

- (RMRPoint*)bottomLeft
{
    return [RMRPoint pointWithX:self.left y:self.bottom];
}

- (RMRPoint*)bottomRight
{
    return [RMRPoint pointWithX:self.right y:self.bottom];
}

- (CGFloat)left
{
    return rc.origin.x;
}

- (CGFloat)top
{
    return rc.origin.y;
}

- (CGFloat)right
{
    return rc.origin.x + rc.size.width;
}

- (CGFloat)bottom
{
    return rc.origin.y + rc.size.height;
}

- (RMRRect*)intersctionWith:(RMRRect*)other
{
    return [RMRRect rectWithCGRect:CGRectIntersection(rc, other.CGRect)];
}

- (RMRRect*)unionWith:(RMRRect*)other
{
    return [RMRRect rectWithCGRect:CGRectUnion(rc, other.CGRect)];
}

- (RMRRect*)insetX:(CGFloat)dx y:(CGFloat)dy
{
    return [RMRRect rectWithCGRect:CGRectInset(rc, dx, dy)];
}

- (BOOL)containsPoint:(RMRPoint*)pt
{
    return CGRectContainsPoint(rc, pt.CGPoint);
}

- (RMRPoint*)centerPoint
{
    return [RMRPoint pointWithX:CGRectGetMinX(rc) y:CGRectGetMidY(rc)];
}


#pragma mark - NSObject

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[RMRRect class]])
    {
        RMRRect* other = (RMRRect*)object;
        return CGRectEqualToRect(rc, other->rc);
    }
    return NO;
}

- (NSUInteger)hash
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    result = prime * result + [[NSNumber numberWithDouble:rc.origin.x] hash];
    result = prime * result + [[NSNumber numberWithDouble:rc.origin.y] hash];
    result = prime * result + [[NSNumber numberWithDouble:rc.size.width] hash];
    result = prime * result + [[NSNumber numberWithDouble:rc.size.height] hash];

    return result;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%f %f %f %f", rc.origin.x, rc.origin.y, rc.size.width, rc.size.height];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    RMRRect* rect = [[[self class] allocWithZone:zone] init];
    rect->rc = rc;
    return rect;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (self)
    {
        NSValue* value = [decoder decodeObjectForKey:kRect];
        rc = value ? [value CGRectValue] : CGRectMake(0, 0, 0, 0);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeInt:1 forKey:kVersion];
    [encoder encodeObject:[NSValue valueWithCGRect:rc] forKey:kRect];
}

@end
