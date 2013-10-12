//
//  UIAlertView+RMRAlertView.m
//

#import "UIAlertView+RMRAlertView.h"
#import <objc/runtime.h>

static const char kRMRAlertWrapper;

//=====================================================================================
@interface RMRAlertWrapper : NSObject

@property (copy) void(^completionBlock)(UIAlertView* alertView, NSInteger buttonIndex);

@end

//=====================================================================================
@implementation RMRAlertWrapper

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock)
        self.completionBlock(alertView, buttonIndex);
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.completionBlock)
        self.completionBlock(alertView, alertView.cancelButtonIndex);
}

@end

//=====================================================================================
@implementation UIAlertView (RMRAlertView)

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion
{
    RMRAlertWrapper* alertWrapper = [[RMRAlertWrapper alloc] init];
    alertWrapper.completionBlock = completion;
    self.delegate = alertWrapper;
    
    objc_setAssociatedObject(self, &kRMRAlertWrapper, alertWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self show];
}

@end