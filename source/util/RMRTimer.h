//
//  RMRTimer.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMRTimer : NSObject {
    NSTimer* timer;
    
    void (^timerBlock)(RMRTimer* timer);
    SEL selector;
    id target;
    
    NSTimeInterval interval;
    BOOL repeats;
}

+ (RMRTimer*)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds callingBlock:(void(^)(RMRTimer*))block;
+ (RMRTimer*)nonRepeatingTimerWithTimeInterval:(NSTimeInterval)seconds callingBlock:(void(^)(RMRTimer*))block;

+ (RMRTimer*)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)selector;
+ (RMRTimer*)nonRepeatingTimerWithTimeInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)selector;

- (void)invalidate;

+ (void)disableTimers;
+ (void)enableTimers;

@end
