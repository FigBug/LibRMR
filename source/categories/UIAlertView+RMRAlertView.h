//
//  UIAlertView+RMRAlertView.h
//

#import <UIKit/UIKit.h>

@interface UIAlertView (RMRAlertView)

- (void)showWithCompletion:(void(^)(UIAlertView* alertView, NSInteger buttonIndex))completion;

@end
