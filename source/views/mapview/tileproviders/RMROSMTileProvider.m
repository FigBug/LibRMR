//
//  RMROSMTileProvider.m
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import "RMROSMTileProvider.h"
#import "RMRMapTypes.h"

@implementation RMROSMTileProvider

- (NSURL *)tileURLForTile:(NSUInteger)x y:(NSUInteger)y zoomLevel:(NSUInteger)zoom
{
	NSString *url = [NSString stringWithFormat:@"http://tile.openstreetmap.org/%d/%d/%d.png", zoom, x, y];
	
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
    return @"OSM";
}

@end
