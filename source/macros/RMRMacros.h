//
//  RMRMacros.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#define RMRSuppressPerformSelectorLeakWarning(x) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        x; \
        _Pragma("clang diagnostic pop") \
    } while (0)
