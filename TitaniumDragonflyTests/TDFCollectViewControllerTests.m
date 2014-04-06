//
//  TDFCollectViewControllerTests.m
//  TitaniumDragonfly
//
//  Created by Current User on 06/04/2014.
//
//

#import "TDFCollectViewController.h"
#import <XCTest/XCTest.h>

@interface TDFCollectViewControllerTests : XCTestCase {
    TDFCollectViewController *_collectViewController;
}

@end

@implementation TDFCollectViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _collectViewController = [TDFCollectViewController new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNil
{
    [_collectViewController loadView];
    XCTAssertNotNil(_collectViewController.view, @"The view should have loaded!");
}

@end
