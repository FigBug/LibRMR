//
//  RMRMapBaseView.h
//  Util
//
//  Created by Roland Rabien on 2013-08-05.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "tileproviders/RMRTileProvider.h"
#import "RMRTileCache.h"

@interface RMRMapBaseView : UIView
{
@private
	RMRTileCache* cache;
	id<RMRTileProvider> tileProvider;
}

@property (nonatomic, assign) id <RMRTileProvider> tileProvider;
@property (nonatomic) NSMutableArray* mapPaths;

- (void)configureLayer;
- (NSString *)cacheDirectory;

@end

