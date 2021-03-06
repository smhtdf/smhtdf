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
    TDFCollectItemViewController *_vc;
}

@end

@implementation TDFCollectItemViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFCollectItemViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setUp_vc_isOfClassTDFCollectItemViewController
{
    XCTAssertEqualObjects([_vc class], [TDFCollectItemViewController class], @"Should be a TDFCollectItemViewController!");
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

- (void)test_loadView_collectItButton_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.collectItButton, @"Button should not be nil");
}

- (void)test_loadView_collectItButtonAction_inventoryItemCollectItbuttonTouched
{
    [_vc loadView];
    XCTAssertEqualObjects([_vc.collectItButton actionsForTarget:_vc forControlEvent:UIControlEventTouchUpInside],
                          @[@"inventoryItemCollectItButtonTouched:"], @"Button should be connected.");
}

@end
