//
//  RMRLabelSlider.h
//  RMR
//
//  Created by Roland Rabien on 2012-10-19.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMRLabelSliderDelegate;

@interface RMRLabelSlider : UIView {
    UISlider* slider;
    UILabel* label;
    double stepValue;
    id<RMRLabelSliderDelegate> delegate;
}

@property (nonatomic) id<RMRLabelSliderDelegate> delegate;
@property (nonatomic) float value;
@property (nonatomic) float maximumValue;
@property (nonatomic) float minimumValue;
@property (nonatomic, getter=isContinuous) BOOL continuous;
@property (nonatomic,readonly) UISlider* slider;
@property (nonatomic,readonly) UILabel* label;
@property (nonatomic) double stepSize;
@property (nonatomic) BOOL enabled;

@end

@protocol RMRLabelSliderDelegate
- (NSString*)textForValue:(RMRLabelSlider*)slider value:(float)value;
@end