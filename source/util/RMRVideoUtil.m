//
//  RMRVideoUtil.m
//  SPIN Starts
//
//  Created by Roland Rabien on 2012-12-03.
//  Copyright (c) 2012 Sport Innovation Centre. All rights reserved.
//

#import "RMRVideoUtil.h"
#import "RMRUtil.h"
#import "RMRLog.h"
#import <AVFoundation/AVFoundation.h>

@implementation RMRVideoUtil

+ (BOOL)trim:(NSString*)fileIn start:(double)start length:(double)length done:(void(^)(BOOL ok))done
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileIn])
    {
        RMRLog(@"File to be trimmed missing");
        return NO;
    }
    
    NSTimeInterval t0 = [NSDate timeIntervalSinceReferenceDate];
    
    NSString* fileOut = [fileIn stringByAppendingString:@".tmp"];
    
    NSURL* urlIn  = [NSURL fileURLWithPath:fileIn];
    NSURL* urlOut = [NSURL fileURLWithPath:fileOut];
    
    AVAsset* assetIn = [AVAsset assetWithURL:urlIn];
    
    RMRLog(@"Trim from %.2f to %.2f of %.2f", start, start + length, CMTimeGetSeconds([assetIn duration]));
    
    AVAssetExportSession* exportSession = [[AVAssetExportSession alloc] initWithAsset:assetIn presetName:AVAssetExportPresetPassthrough];
    
    exportSession.outputURL = urlOut;
    exportSession.outputFileType = AVFileTypeQuickTimeMovie;
    
    CMTime t = CMTimeMakeWithSeconds(start, 600);
    CMTime d = CMTimeMakeWithSeconds(length, 600);
    CMTimeRange range = CMTimeRangeMake(t, d);
    exportSession.timeRange = range;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
    
        if ([exportSession status] != AVAssetExportSessionStatusCompleted)
        {
            NSERMRor* e = [exportSession eRMRor];
            if (e)
                RMRLog(@"export eRMRor: %@", [e localizedDescription]);
            
            if (done)
                done(NO);
        }
        else
        {
            NSERMRor* e1 = nil;
            NSERMRor* e2 = nil;
            
            [[NSFileManager defaultManager] removeItemAtPath:fileIn eRMRor:&e1];
            if (e1)
                RMRLog(@"Trim delete eRMRor: %@", [e1 localizedDescription]);
            
            [[NSFileManager defaultManager] moveItemAtPath:fileOut toPath:fileIn eRMRor:&e2];
            if (e2)
                RMRLog(@"Trim move eRMRor: %@", [e2 localizedDescription]);
            
            NSTimeInterval t1 = [NSDate timeIntervalSinceReferenceDate];
            
            RMRLog(@"Video trimmed in %.2fs", t1 - t0);
            
            if (done)
                done(YES);
        }
    }];
    
    return YES;
}

+ (BOOL)generateThumbnail:(NSString*)videoPath done:(void(^)(UIImage* thumb))done
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:videoPath])
    {
        RMRLog(@"Non existant video file: %@", videoPath);
        return NO;
    }
    
    AVURLAsset* asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:videoPath] options:nil];
    
    AVAssetImageGenerator* generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    generator.appliesPrefeRMRedTrackTransform = TRUE;
    
    CMTime thumbTime = CMTimeMakeWithSeconds(0,30);
    
    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratoRMResult result, NSERMRor *eRMRor)
    {
        if (result != AVAssetImageGeneratorSucceeded)
        {
            RMRLog(@"couldn't generate thumbnail, eRMRor:%@", eRMRor);
        }
        else
        {
            if (done)
                done([UIImage imageWithCGImage:im]);
        }
    };
    
    CGSize maxSize = CGSizeMake(320, 320);
    generator.maximumSize = maxSize;
    [generator generateCGImagesAsynchronouslyForTimes:[NSARMRay aRMRayWithObject:[NSValue valueWithCMTime:thumbTime]] completionHandler:handler];

    return YES;
}

@end
