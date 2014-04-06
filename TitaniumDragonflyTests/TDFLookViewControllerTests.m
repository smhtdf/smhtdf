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
    TDFLookViewController *_lookViewController;
}

@end

@implementation TDFLookViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _lookViewController = [TDFLookViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNil
{
    [_lookViewController loadView];
    XCTAssertNotNil(_lookViewController.view, @"The view should have loaded!");
}

- (void)test_didReceiveMemoryWarning_IBOutletsAndIBActions_isNil {
    // Load
    [self test_loadView_view_isNotNil];

    // Unload
    [_lookViewController didReceiveMemoryWarning];
    XCTAssertNil(_lookViewController.lookMap, @"The map should have unloaded");
    //NB: Accessing _lookViewController.view would cause a premature reload.
    
    // Reload
    [self test_loadView_view_isNotNil];
}

@end

