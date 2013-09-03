//
//  RMRDropbox.h
//
//  Created by Roland Rabien on 2012-12-07.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "RMRDropboxTransfer.h"
#import <DropboxSDK/DropboxSDK.h>

//==================================================================

FOUNDATION_EXPORT NSString* const RMREventDropboxEvent;
FOUNDATION_EXPORT NSString* const RMREventDropboxProgress;

//==================================================================

@interface RMRDropbox : NSObject<DBRestClientDelegate> {
    DBSession* dbSession;
    DBRestClient* dbClient;
    
    NSMutableArray* transfers;
}

+ (void)setKey:(NSString*)key secret:(NSString*)secret;
+ (RMRDropbox*)sharedDropbox;

-(BOOL)isLinked;
-(void)unlinkAll;
-(void)linkFromController:(UIViewController*)controller;

-(NSArray*)transfers;

-(BOOL)transferInProgress;
-(BOOL)transferPending;

-(void)sendFile:(NSString*)filePath dstFileName:(NSString*)dest deleteWhenFinished:(BOOL)autoDelete;
-(BOOL)canHandleUrl:(NSURL*)url;
-(void)handleUrl:(NSURL*)url;

@end