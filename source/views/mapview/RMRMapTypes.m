//
//  RMRMapTypes.m
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import "RMRMapTypes.h"

RMRMapCoordinate RMRMapCoordinateMake (RMRLatitude lat, RMRLongitude lng)
{
	return (RMRMapCoordinate) { .latitude = lat, .longitude = lng };
}

NSUInteger RMRMapZoomLevelFromScale (NSUInteger scale)
{
	return log2(scale);
}

NSUInteger RMRMapScaleFromZoomLevel (NSUInteger zoomLevel)
{
	return pow(2, zoomLevel);
}
