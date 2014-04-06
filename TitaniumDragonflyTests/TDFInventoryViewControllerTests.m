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
    TDFInventoryViewController *_inventoryViewController;
}

@end

@implementation TDFInventoryViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _inventoryViewController = [TDFInventoryViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNull
{
    [_inventoryViewController loadView];
    XCTAssertNotNil(_inventoryViewController.view, @"The view should have loaded!");
}

@end
