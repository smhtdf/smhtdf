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
    TDFCollectViewController *_vc;
}

@end

@implementation TDFCollectViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _vc = [storyboard instantiateViewControllerWithIdentifier:@"TDFCollectViewController"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setUp_vc_isOfClassTDFInventoryViewController
{
    XCTAssertEqualObjects([_vc class], [TDFCollectViewController class], @"Should be a TDFCollectViewController!");
}

- (void)test_loadView_view_isNotNil
{
    [_vc loadView];
    XCTAssertNotNil(_vc.view, @"The view should have loaded!");
}

@end
