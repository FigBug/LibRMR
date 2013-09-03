//
//  RMRVideoUtil.h
//  SPIN Starts
//
//  Created by Roland Rabien on 2012-12-03.
//  Copyright (c) 2012 Sport Innovation Centre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMRVideoUtil : NSObject

+ (BOOL)trim:(NSString*)file start:(double)start length:(double)length done:(void(^)(BOOL ok))done;
+ (BOOL)generateThumbnail:(NSString*)videoPath done:(void(^)(UIImage*))done;

@end
