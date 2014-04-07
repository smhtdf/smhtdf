//
//  TDFMapAnnotationTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 07/04/2014.
//
//

#import "TDFMapAnnotation.h"
#import <XCTest/XCTest.h>
#import <MapKit/MapKit.h>

@interface TDFMapAnnotationTests : XCTestCase {
    TDFMapAnnotation *_ma;
}

@end

@implementation TDFMapAnnotationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_class_conformsToProtocol_MKAnnotation
{
    XCTAssert([TDFMapAnnotation conformsToProtocol:@protocol(MKAnnotation)], @"Map annotation must conform to MKAnnotation protocol");
}

- (void)test_initWithLocation_appleHQ_atAppleHQ
{
    CLLocationDegrees latitude = 37.331789;
    CLLocationDegrees longitude = -122.029620;
    CLLocationCoordinate2D appleHQ = CLLocationCoordinate2DMake(latitude, longitude);
    
    XCTAssertNil(_ma, @"Should be nil before allocation");
    _ma = [[TDFMapAnnotation alloc] initWithLocation:appleHQ];
    XCTAssertNotNil(_ma, @"Should not be nil after allocation");
    
    XCTAssertEqual(_ma.coordinate.latitude, 37.331789, @"Latitude should be 37.331789 after initializaiton");
    XCTAssertEqual(_ma.coordinate.longitude, -122.029620, @"Longitude should be -122.029620 after initialization");
}

@end
