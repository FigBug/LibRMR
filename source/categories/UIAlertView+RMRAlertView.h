//
//  UIAlertView+RMRAlertView.h
//  SPIN Starts
//

#import <UIKit/UIKit.h>

@interface UIAlertView (RMRAlertView)

- (void)showWithCompletion:(void(^)(UIAlertView* alertView, NSInteger buttonIndex))completion;

@end
