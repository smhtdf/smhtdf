//
//  TDFLookViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 04/04/2014.
//
//

#import "TDFLookViewController.h"
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

@end

