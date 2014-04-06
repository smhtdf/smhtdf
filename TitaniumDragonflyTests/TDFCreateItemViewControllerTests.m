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
    TDFCreateItemViewController *_vc;
}

@end

@implementation TDFCreateItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFCreateItemViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_loadView_view_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.view, @"view should have loaded");
}

- (void)test_loadView_inventoryItemNameTextField_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.inventoryItemNameTextField, @"Text field should not be nil");
}

- (void)test_loadView_createItButton_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.createItButton, @"Button should not be nil");
}

- (void)test_loadView_createItButtonAction_inventoryItemCreateItbuttonTouched
{
    [_vc loadView];
    XCTAssertEqualObjects([_vc.createItButton actionsForTarget:_vc forControlEvent:UIControlEventTouchUpInside],
                   @[@"inventoryItemCreateItButtonTouched:"], @"Button should be connecte.");
}

@end
