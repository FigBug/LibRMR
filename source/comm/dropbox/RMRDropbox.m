//
//  RMRDropbox.m
//
//  Created by Roland Rabien on 2012-12-07.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import "RMRDropbox.h"
#import "RMRUtil.h"

#ifdef RMR_HAS_DROPBOX

NSString* const RMREventDropboxEvent     = @"RMREventDropboxEvent";
NSString* const RMREventDropboxProgress  = @"RMREventDropboxProgress";

static NSString* appKey;
static NSString* appSecret;

@implementation RMRDropbox

+ (void)setKey:(NSString*)key_ secret:(NSString*)secret_
{
    appKey      = key_;
    appSecret   = secret_;
}

+ (RMRDropbox*)sharedDropbox
{
    static RMRDropbox* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RMRDropbox alloc] init];
    });
    return sharedInstance;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        transfers = [[NSMutableArray alloc] init];
        
        dbSession = [[DBSession alloc] initWithAppKey:appKey appSecret:appSecret root:kDBRootAppFolder];
        [DBSession setSharedSession:dbSession];
        
        dbClient = [[DBRestClient alloc] initWithSession:dbSession];
        dbClient.delegate  = self;
    }
    return self;
}

-(NSArray*)transfers
{
    return [NSArray ArrayWithArray:transfers];
}

-(BOOL)isLinked
{
    return [dbSession isLinked];
}

-(void)unlinkAll
{
    [dbSession unlinkAll];
}

-(void)linkFromController:(UIViewController*)controller
{
    [dbSession linkFromController:controller];
}

-(BOOL)canHandleUrl:(NSURL*)url
{
    return [dbSession handleOpenURL:url];
}

-(void)handleUrl:(NSURL*)url
{
    if ([dbSession isLinked])
    {
        [[[UIAlertView alloc] initWithTitle:@"Dropbox" message:@"Dropbox Login OK." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"Dropbox" message:@"Dropbox Login Failed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName: RMREventDropboxEvent object: nil];
}

-(BOOL)transferInProgress
{
    for (RMRDropboxTransfer* transfer in transfers)
    {
        if (!transfer.pending && !transfer.complete)
            return YES;
    }
    return NO;
}

-(BOOL)transferPending
{
    for (RMRDropboxTransfer* transfer in transfers)
    {
        if (transfer.pending)
            return YES;
    }
    return NO;
}

-(void)sendFile:(NSString*)filePath dstFileName:(NSString*)dest deleteWhenFinished:(BOOL)autoDelete;
{
    RMRDropboxTransfer* transfer = [[RMRDropboxTransfer alloc] init];
    
    transfer.srcPath    = filePath;
    transfer.dstName    = dest;
    transfer.dstPath    = @"/";
    transfer.complete   = NO;
    transfer.progress   = 0;
    transfer.autodelete = autoDelete;
    transfer.fileSize   = [RMRUtil fileSize:filePath];

    if (!self.transferInProgress)
    {
        transfer.pending = NO;
        [dbClient uploadFile:transfer.dstName toPath:transfer.dstPath withParentRev:nil fromPath:transfer.srcPath];
        NSLog(@"Starting Transfer: %@ as %@", [filePath lastPathComponent], dest);
    }
    else
    {
        transfer.pending = YES;
        NSLog(@"Pending Transfer");
    }
    
    [transfers addObject:transfer];
}

-(void)startNextTransfer
{
    if (self.transferInProgress)
        return;
 
    NSLog(@"Searching for pending transfers");
    for (RMRDropboxTransfer* transfer in transfers)
    {
        if (transfer.pending)
        {
            NSLog(@"Pending transfer starting");
            
            transfer.pending = NO;
            [dbClient uploadFile:transfer.dstName toPath:transfer.dstPath withParentRev:nil fromPath:transfer.srcPath];   
            
            return;
        }
    }
}

- (RMRDropboxTransfer*)transferForSrc:(NSString*)srcPath
{
    for (RMRDropboxTransfer* transfer in transfers)
    {
        if ([transfer.srcPath isEqualToString:srcPath])
            return transfer;
    }
    return nil;
}

- (void)restClient:(DBRestClient*)client uploadedFile:(NSString*)destPath from:(NSString*)srcPath metadata:(DBMetadata*)metadata
{
    RMRDropboxTransfer* transfer = [self transferForSrc:srcPath];
    
    transfer.complete = YES;
    transfer.progress = 1.0;
    
    if (transfer.autodelete)
        [[NSFileManager defaultManager] removeItemAtPath:transfer.srcPath error:nil];
    
    [self startNextTransfer];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RMREventDropboxProgress object:transfer];
    
    NSLog(@"Upload Complete: %@", [srcPath lastPathComponent]);
}

- (void)restClient:(DBRestClient*)client uploadProgress:(CGFloat)progress forFile:(NSString*)destPath from:(NSString*)srcPath;
{
    RMRDropboxTransfer* transfer = [self transferForSrc:srcPath];
    
    transfer.progress = progress;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RMREventDropboxProgress object:transfer];
    
    NSLog(@"Upload Progres: %d%% %@", (int)(progress * 100), [srcPath lastPathComponent]);
}

- (void)restClient:(DBRestClient*)client uploadFileFailedWithError:(NSError*)error
{
    RMRDropboxTransfer* transfer = [self transferForSrc:[[error userInfo] objectForKey:@"sourcePath"]];
    
    transfer.complete = YES;
    transfer.progress = 1.0;
    transfer.error    = YES;
    
    if (transfer.autodelete)
        [[NSFileManager defaultManager] removeItemAtPath:transfer.srcPath error:nil];
    
    [self startNextTransfer];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RMREventDropboxProgress object:transfer];
    
    NSLog(@"Upload Failed: %@", [[[error userInfo] objectForKey:@"sourcePath"] lastPathComponent]);
}

@end

#endif