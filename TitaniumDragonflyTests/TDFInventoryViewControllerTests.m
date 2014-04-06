//
//  TDFInventoryViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 06/04/2014.
//
//

#import "TDFInventoryViewController.h"
#import <XCTest/XCTest.h>

@interface TDFInventoryViewControllerTests : XCTestCase {
    TDFInventoryViewController *_vc;
}

@end

@implementation TDFInventoryViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _vc = [TDFInventoryViewController new];
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
    //NB: No IBOutlets or IBActions to check.
    //NB: Accessing the view property would cause a premature reload.
    
    // Reload
    [self test_loadView_view_isNotNil];
}

@end
