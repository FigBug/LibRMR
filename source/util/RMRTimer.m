//
//  RMRTimer.m
//  RMR
//
//  Created by Roland Rabien on 2013-09-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRTimer.h"
#import "RMRMacros.h"

@implementation RMRTimer

+ (RMRTimer*)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds callingBlock:(void(^)(RMRTimer*))block
{
    RMRTimer* t     = [[RMRTimer alloc] init];
    
    t->timer        = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    t->timerBlock   = block;
    
    [[NSRunLoop mainRunLoop] addTimer:t->timer forMode:NSDefaultRunLoopMode];
    
    return t;
}

+ (RMRTimer*)nonRepeatingTimerWithTimeInterval:(NSTimeInterval)seconds callingBlock:(void(^)(RMRTimer*))block
{
    RMRTimer* t     = [[RMRTimer alloc] init];
    
    t->timer        = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    t->timerBlock   = block;
    
    [[NSRunLoop mainRunLoop] addTimer:t->timer forMode:NSDefaultRunLoopMode];
    
    return t;
}

+ (RMRTimer*)repeatingTimerWithTimeInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)selector
{
    RMRTimer* t = [[RMRTimer alloc] init];
    
    t->timer    = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    t->selector = selector;
    t->target   = target;
    
    [[NSRunLoop mainRunLoop] addTimer:t->timer forMode:NSDefaultRunLoopMode];
    
    return t;
}

+ (RMRTimer*)nonRepeatingTimerWithTimeInterval:(NSTimeInterval)seconds target:(id)target selector:(SEL)selector
{
    RMRTimer* t = [[RMRTimer alloc] init];
    
    t->timer    = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    t->selector = selector;
    t->target   = target;
    
    [[NSRunLoop mainRunLoop] addTimer:t->timer forMode:NSDefaultRunLoopMode];
    
    return t;
}

- (void)invalidate
{
    [timer invalidate];
    timer = nil;
}

- (void)timerFired:(NSTimer*)timer
{
    if (timerBlock)
    {
        timerBlock(self);
    }
    else if (target && selector)
    {
        RMRSuppressPerformSelectorLeakWarning([target performSelector:selector withObject:self]);
    }
}

@end
