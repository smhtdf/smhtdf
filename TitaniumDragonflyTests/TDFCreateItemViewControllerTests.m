//
//  TDFCreateItemViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 06/04/2014.
//
//

#import "TDFCreateItemViewController.h"
#import <XCTest/XCTest.h>

@interface TDFCreateItemViewControllerTests : XCTestCase {
    TDFCreateItemViewController *_createItemViewController;
}

@end

@implementation TDFCreateItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _createItemViewController = [TDFCreateItemViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNull;
{
    [_createItemViewController loadView];
    XCTAssertNotNil(_createItemViewController.view, @"The view should have loaded!");
}

@end
