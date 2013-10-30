//
//  RMR.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "macros/RMRMacros.h"

#import "categories/NSArray+RMRArray.h"
#import "categories/NSDate+RMRDate.h"
#import "categories/NSFileManager+RMRFileManager.h"
#import "categories/NSMutableString+RMRMutableString.h"
#import "categories/NSObject+RMRCast.h"
#import "categories/NSString+RMRString.h"
#import "categories/UIColor+RMRColor.h"
#import "categories/UIView+RMRLayout.h"
#import "categories/UIView+RMRRect.h"

#import "comm/dropbox/RMRDropbox.h"

#import "containers/RMR2DArray.h"

#import "types/RMRLine.h"
#import "types/RMRPair.h"
#import "types/RMRPoint.h"
#import "types/RMRRect.h"

#import "util/RMRArchiveReader.h"
#import "util/RMRArchiveWriter.h"
#import "util/RMRButterworthFilter.h"
#import "util/RMRDefaults.h"
#import "util/RMRLog.h"
#import "util/RMRRollingAverage.h"
#import "util/RMRTimer.h"
#import "util/RMRUtil.h"
#import "util/RMRVideoUtil.h"
#import "util/location/RMRLocationManager.h"
#import "util/location/RMRLocationWatcher.h"

#import "views/cpumeter/RMRCPUMeter.h"
#import "views/mapview/RMRMapView.h"
#import "views/mapview/tileproviders/RMRMapQuestOSMTileProvider.h"
#import "views/mapview/tileproviders/RMROpenCycleMapLandscapeTileProvider.h"
#import "views/mapview/tileproviders/RMROpenCycleMapTileProvider.h"
#import "views/mapview/tileproviders/RMROpenCycleMapTransportTileProvider.h"
#import "views/mapview/tileproviders/RMROSMTileProvider.h"
#import "views/mapview/tileproviders/RMRStamenTerrainTileProvider.h"
#import "views/simpletableview/RMRSimpleTableViewController.h"
#import "views/simpletableview/RMRSimpleTableViewGroup.h"
#import "views/simpletableview/RMRSimpleTableViewItem.h"
#import "views/textgrid/RMRTextGrid.h"