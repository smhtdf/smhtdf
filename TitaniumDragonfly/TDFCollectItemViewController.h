//
//  TDFCollectItemViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TDFCollectItemViewController : UIViewController

@property (strong, nonatomic) PFObject *itemObject;
@property (strong, nonatomic) IBOutlet UIButton *collectItButton;
@property (strong, nonatomic) IBOutlet UILabel *inventoryItemNameLabel;
- (IBAction)inventoryItemCollectItButtonTouched:(id)sender;

@property (copy, nonatomic) void (^collectItemCompletionBlock)(void);

@end
