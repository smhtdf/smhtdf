//
//  TDFCreateItemViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import <UIKit/UIKit.h>

@interface TDFCreateItemViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *inventoryItemNameTextField;
- (IBAction)inventoryItemCreateItButtonTouched:(id)sender;

@property (copy, nonatomic) void (^createItemCompletionBlock)(void);

@end
