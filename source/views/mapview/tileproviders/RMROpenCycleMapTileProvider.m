//
//  RMROpenCycleMapTileProvider.m
//
//  Copyright Roland Rabien 2013. All rights reserved.
//

#import "RMROpenCycleMapTileProvider.h"
#import "RMRMapTypes.h"

@implementation RMROpenCycleMapTileProvider

- (NSURL *)tileURLForTile:(NSUInteger)x y:(NSUInteger)y zoomLevel:(NSUInteger)zoom
{
	NSString *url = [NSString stringWithFormat:@"http://a.tile.opencyclemap.org/cycle/%d/%d/%d.png", zoom, x, y];
	
	return [NSURL URLWithString:url];
}

- (NSUInteger)minZoomLevel
{
	return 0;
}

- (NSUInteger)maxZoomLevel
{
	return 18;
}

- (CGSize)tileSize
{
	return CGSizeMake(256.0f, 256.0f);
}
- (NSString*)prefix
{
    return @"OCM";
}

@end
