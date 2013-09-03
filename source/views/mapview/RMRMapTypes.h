//
//  MRMapTypes.h
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

typedef double RMRLatitude;
typedef double RMRLongitude;

struct _RMRMapCoordinate
{
	RMRLatitude latitude;
	RMRLongitude longitude;
};

typedef struct _RMRMapCoordinate RMRMapCoordinate;

RMRMapCoordinate RMRMapCoordinateMake (RMRLatitude lat, RMRLongitude lng);

// Convert between map scales and zoom levels
NSUInteger RMRMapZoomLevelFromScale(NSUInteger scale);
NSUInteger RMRMapScaleFromZoomLevel(NSUInteger zoomLevel);
