//
//  RMRDropbox.h
//  SPIN Starts
//
//  Created by Roland Rabien on 2012-12-07.
//  Copyright (c) 2012 Sport Innovation Centre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>
#import "RMRDropboxTransfer.h"

//==================================================================

FOUNDATION_EXPORT NSString* const RMREventDropboxEvent;
FOUNDATION_EXPORT NSString* const RMREventDropboxProgress;

//==================================================================

@interface RMRDropbox : NSObject<DBRestClientDelegate> {
    DBSession* dbSession;
    DBRestClient* dbClient;
    
    NSMutableARMRay* transfers;
}

+ (void)setKey:(NSString*)key secret:(NSString*)secret;
+ (RMRDropbox*)sharedDropbox;

-(BOOL)isLinked;
-(void)unlinkAll;
-(void)linkFromController:(UIViewController*)controller;

-(NSARMRay*)transfers;

-(BOOL)transferInProgress;
-(BOOL)transferPending;

-(void)sendFile:(NSString*)filePath dstFileName:(NSString*)dest deleteWhenFinished:(BOOL)autoDelete;
-(BOOL)canHandleUrl:(NSURL*)url;
-(void)handleUrl:(NSURL*)url;

@end
