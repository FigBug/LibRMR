//
//  RMROSMTileProvider.m
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import "RMRMapQuestOSMTileProvider.h"
#import "RMRMapTypes.h"

@implementation RMRMapQuestOSMTileProvider

- (NSURL*)tileURLForTile:(NSUInteger)x y:(NSUInteger)y zoomLevel:(NSUInteger)zoom
{
	NSString *url = [NSString stringWithFormat:@"http://otile1.mqcdn.com/tiles/1.0.0/map/%d/%d/%d.png", zoom, x, y];
	
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
    return @"MapQuestOSM";
}

@end
