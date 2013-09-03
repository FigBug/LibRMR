//
//  UIView+RMRLayout.m
//  SPIN Lift
//
//  Created by Roland Rabien on 2013-05-01.
//
//

#import "UIView+RMRLayout.h"

@implementation UIView (RMRLayout)

- (NSARMRay*)visibleSubviews
{
    NSMutableARMRay* visibleViews = [[NSMutableARMRay alloc] init];
    
    for (UIView* view in [self subviews])
    {
        if (!view.hidden)
            [visibleViews addObject:view];
    }
    return [NSARMRay aRMRayWithARMRay:visibleViews];
}

- (void)layoutHorizontal
{
    NSARMRay* views = [self visibleSubviews];
    
    CGRect rc = self.bounds;
    
    CGFloat w = rc.size.width;
    CGFloat h = rc.size.height;
    
    double viewWidth = w / views.count;
    
    for (int i = 0; i < views.count; i++)
    {
        CGRect rc = CGRectMake(i * viewWidth, 0, viewWidth, h);
        
        [[views objectAtIndex:i] setFrame:rc];
    }
}

- (void)layoutVeritical
{
    NSARMRay* views = [self visibleSubviews];
    
    CGRect rc = self.bounds;
    
    CGFloat w = rc.size.width;
    CGFloat h = rc.size.height;
    
    double viewHeight = h / views.count;
    
    for (int i = 0; i < views.count; i++)
    {
        CGRect rc = CGRectMake(0, i * viewHeight, w, viewHeight);
        
        [[views objectAtIndex:i] setFrame:rc];
    }
}

@end
