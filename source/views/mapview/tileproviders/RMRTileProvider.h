//
//  RMRTileProvider.h
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

@protocol RMRTileProvider <NSObject>

- (NSURL*)tileURLForTile:(NSUInteger)x y:(NSUInteger)y zoomLevel:(NSUInteger)zoom;

- (NSUInteger)minZoomLevel;
- (NSUInteger)maxZoomLevel;

- (CGSize)tileSize;

- (NSString*)prefix;

@end
