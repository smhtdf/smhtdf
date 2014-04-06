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
    TDFDropItemViewController *_vc;
}

@end

@implementation TDFDropItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFDropItemViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setUp_vc_isOfClassTDFDropItemViewController
{
    XCTAssertEqualObjects([_vc class], [TDFDropItemViewController class], @"Should be a TDFDropItemViewController!");
}

- (void)test_loadView_view_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.view, @"The view should have loaded!");
}

- (void)test_loadView_inventoryItemNameLabel_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.inventoryItemNameLabel, @"Label should not be nil");
}

- (void)test_loadView_dropItButton_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.dropItButton, @"Button should not be nil");
}

- (void)test_loadView_dropItButtonAction_inventoryItemDropItbuttonTouched
{
    [_vc loadView];
    XCTAssertEqualObjects([_vc.dropItButton actionsForTarget:_vc forControlEvent:UIControlEventTouchUpInside],
                          @[@"inventoryItemDropItButtonTouched:"], @"Button should be connected.");
}

@end
