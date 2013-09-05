//
//  RMRDropboxTransfer.h
//
//  Created by Roland Rabien on 2012-12-07.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

@interface RMRDropboxTransfer : NSObject

@property (nonatomic,copy) NSString* srcPath;
@property (nonatomic,copy) NSString* dstPath;
@property (nonatomic,copy) NSString* dstName;
@property (nonatomic) double progress;
@property (nonatomic) BOOL pending;
@property (nonatomic) BOOL complete;
@property (nonatomic) BOOL autodelete;
@property (nonatomic) BOOL error;
@property (nonatomic) int64_t fileSize;

@end
