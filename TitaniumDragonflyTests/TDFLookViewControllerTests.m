//
//  TDFLookViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 04/04/2014.
//
//

#import "TDFLookViewController.h"
#import <OCMock/OCMockObject.h>
#import <XCTest/XCTest.h>

@interface TDFLookViewControllerTests : XCTestCase {
    TDFLookViewController *_vc;
}

@end

@implementation TDFLookViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFLookViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setUp_vc_isOfClassTDFLookViewController
{
    XCTAssertEqual([_vc class], [TDFLookViewController class], @"Should be of class TDFLookViewController");
}

- (void)test_loadView_view_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.view, @"The view should have loaded!");
}

- (void)test_loadView_lookMap_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.lookMap, @"Map should not be nil.");
}

- (void)test_locationDidChange_lookMap_setRegion
{
    // TEST GITHUB -- BugzID 30
    // Create the mock map
    id lookMapMock = [OCMockObject mockForClass:[MKMapView class]];
    
    // The expected center
    CLLocationDegrees latitude = 0;
    CLLocationDegrees longitude = 0;
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);

    // The expected span
    CLLocationDegrees latitudeDelta = 0.018;
    CLLocationDegrees longitudeDelta = 0.000;
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);

    // The expected region and animated parameter
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    BOOL animated = YES;

    // Register expected invokations
    [[lookMapMock expect] setRegion:region animated:animated];
    _vc.lookMap = lookMapMock;

    // Dummy inputs
    NSString *name = nil;
    id object = nil;
    
    // Pack input location
    CLLocation *location = [[CLLocation alloc] initWithLatitude:0 longitude:0];
    NSDictionary *userInfo = @{@"location": location};
    NSNotification *note = [[NSNotification alloc] initWithName:name object:object userInfo:userInfo];
    
    // Invoke method under test
    [_vc locationDidChange:note];
    
    // Verify all expected invokations have occurred
    [lookMapMock verify];
}

@end

