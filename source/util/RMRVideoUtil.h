//
//  RMRVideoUtil.h
//
//  Created by Roland Rabien on 2012-12-03.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

@interface RMRVideoUtil : NSObject

+ (BOOL)trim:(NSString*)file start:(double)start length:(double)length done:(void(^)(BOOL ok))done;
+ (BOOL)generateThumbnail:(NSString*)videoPath done:(void(^)(UIImage*))done;

@end
