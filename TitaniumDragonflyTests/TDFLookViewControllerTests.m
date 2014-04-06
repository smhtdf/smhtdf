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
    
    _vc = [TDFLookViewController new];
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

- (void)test_didReceiveMemoryWarning_IBOutletsAndIBActions_isNil {
    // Load
    [self test_loadView_view_isNotNil];

    // Unload
    [_vc didReceiveMemoryWarning];
    XCTAssertNil(_vc.lookMap, @"The map should have unloaded");
    //NB: Accessing the view property would cause a premature reload.
    
    // Reload
    [self test_loadView_view_isNotNil];
}

@end

