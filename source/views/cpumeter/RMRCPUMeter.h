//
//  RMRCPUMeter.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-11.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../util/RMRTimer.h"

// CPU Usage from:
// http://stackoverflow.com/questions/8223348/ios-get-cpu-usage-from-application

@interface RMRCPUMeter : UILabel {
    RMRTimer* timer;
}

@end
