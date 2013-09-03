//
//  RMRProjection.h
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import "RMRMapTypes.h"

@protocol RMRProjection <NSObject>

// Convert pixel coordinates to latitude / longitude and vice-versa

- (CGPoint)pointForCoordinate:(RMRMapCoordinate)coordinate zoomLevel:(NSUInteger)zoom tileSize:(CGSize)tileSize;
- (RMRMapCoordinate)coordinateForPoint:(CGPoint)point zoomLevel:(NSUInteger)zoom tileSize:(CGSize)tileSize;

@end
