//
//  RMRArchiveReader.h
//  LibRMR
//
//  Created by Roland Rabien on 2013-09-03.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#ifdef RMR_HAS_ARCHIVE

@interface RMRArchiveReader : NSObject {
    NSString* srcPath;
}

+ (RMRArchiveReader*)archiveWriterForPath:(NSString*)path;

- (BOOL)extractToPath:(NSString*)dstPath;

@end

#endif