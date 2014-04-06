//
//  TDFCollectItemViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 06/04/2014.
//
//

#import "TDFCollectItemViewController.h"
#import <XCTest/XCTest.h>

@interface TDFCollectItemViewControllerTests : XCTestCase {
    TDFCollectItemViewController *_collectItemViewController;
}

@end

@implementation TDFCollectItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _collectItemViewController = [TDFCollectItemViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNil
{
    [_collectItemViewController loadView];
    XCTAssertNotNil(_collectItemViewController.view, @"The view should have loaded!");
}

@end
