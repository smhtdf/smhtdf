//
//  TDFMapAnnotation.h
//  TitaniumDragonfly
//
//  Created by Current User on 07/04/2014.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TDFMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
