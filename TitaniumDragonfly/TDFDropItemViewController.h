//
//  TDFDropItemViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TDFDropItemViewController : UIViewController

@property (strong, nonatomic) PFGeoPoint *geoPoint;
@property (strong, nonatomic) PFObject *itemObject;

@property (strong, nonatomic) IBOutlet UIButton *dropItButton;
@property (strong, nonatomic) IBOutlet UILabel *inventoryItemNameLabel;
- (IBAction)inventoryItemDropItButtonTouched:(id)sender;

@property (copy, nonatomic) void (^dropItemCompletionBlock)(void);

@end
