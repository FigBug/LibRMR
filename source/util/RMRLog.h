//
//  RMRLog.h
//
//  Created by Roland Rabien on 2013-06-04.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

void RMRLogOpen();
    
void RMRLogClose();
    
void RMRLogClear();
    
void RMRLog(NSString* format, ...);

#ifdef __cplusplus
}
#endif