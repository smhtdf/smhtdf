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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFInventoryViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setUp_vc_isOfClassTDFInventoryViewController
{
    XCTAssertEqualObjects([_vc class], [TDFInventoryViewController class], @"Should be a TDFInventoryViewController!");
}

- (void)test_loadView_view_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.view, @"The view should have loaded!");
}

@end
