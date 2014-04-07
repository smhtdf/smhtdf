//
//  TDFMapAnnotation.m
//  TitaniumDragonfly
//
//  Created by Current User on 07/04/2014.
//
//

#import "TDFMapAnnotation.h"

@interface TDFMapAnnotation ()

@end

@implementation TDFMapAnnotation

- (id)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if (!self) return nil;
    
    _coordinate = coord;
    return self;
}

@end
