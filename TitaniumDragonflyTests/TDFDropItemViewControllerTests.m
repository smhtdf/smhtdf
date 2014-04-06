//
//  TDFDropItemViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 06/04/2014.
//
//

#import "TDFDropItemViewController.h"
#import <XCTest/XCTest.h>

@interface TDFDropItemViewControllerTests : XCTestCase {
    TDFDropItemViewController *_dropItemViewController;
}

@end

@implementation TDFDropItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _dropItemViewController = [TDFDropItemViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNil
{
    [_dropItemViewController loadView];
    XCTAssertNotNil(_dropItemViewController.view, @"The view should have loaded!");
}

@end
