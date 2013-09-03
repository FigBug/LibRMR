//
//  RMRMapView.h
//  MapKit
//
//  Copyright Matt Rajca 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMRMapTypes.h"
#import "RMRMapPath.h"
#import "RMRMapBaseView.h"

@class RMRMapBaseView;
@protocol RMRTileProvider, RMRProjection;

/*
  NOTE: RMRMapView sets itself as the delegate of its UIScrollView superclass
  Don't change it!
  
  The QuartzCore framework must also be linked against in order to use RMRMapView
*/

@interface RMRMapView : UIScrollView <UIScrollViewDelegate>
{
@private
	RMRMapBaseView* baseView;
	
	id <RMRTileProvider> tileProvider;
	id <RMRProjection> mapProjection;
}

/*
  If you don't use the - initWithFrame:tileProvider: initializer, the
  tile provider will be nil. It MUST be set in order to display any tiles
*/
@property (nonatomic, retain) id <RMRTileProvider> tileProvider;

// The default projection is RMRMercatorProjection
@property (nonatomic, retain) id <RMRProjection> mapProjection;

@property (nonatomic, assign) RMRMapCoordinate center; // animated
@property (nonatomic, assign) NSUInteger zoomLevel;   // animated


// tileProvider must not be nil
- (id)initWithFrame:(CGRect)frame tileProvider:(id <RMRTileProvider>)tileProvider;

- (void)setCenter:(RMRMapCoordinate)coord animated:(BOOL)anim;
- (void)setZoomLevel:(NSUInteger)zoom animated:(BOOL)anim;

- (void)addPath:(RMRMapPath*)path;
- (void)removePath:(RMRMapPath*)path;

@end
