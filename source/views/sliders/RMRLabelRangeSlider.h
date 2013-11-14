//
//  RMRLabelSlider.h
//  RMR
//
//  Created by Roland Rabien on 2012-10-19.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NMRangeSlider;
@protocol RMRLabelRangeSliderDelegate;

@interface RMRLabelRangeSlider : UIView {
    NMRangeSlider* slider;
    UILabel* label;
    id<RMRLabelRangeSliderDelegate> delegate;
}

@property (nonatomic) id<RMRLabelRangeSliderDelegate> delegate;
@property (nonatomic) float lowerValue;
@property (nonatomic) float upperValue;
@property (nonatomic) float maximumValue;
@property (nonatomic) float minimumValue;
@property (nonatomic, getter=isContinuous) BOOL continuous;
@property (nonatomic,readonly) NMRangeSlider* slider;
@property (nonatomic,readonly) UILabel* label;
@property (nonatomic) double stepSize;
@property (nonatomic) BOOL enabled;

@end

@protocol RMRLabelRangeSliderDelegate
- (NSString*)textForValue:(RMRLabelRangeSlider*)slider lower:(float)v1 upper:(float)v2;
@end