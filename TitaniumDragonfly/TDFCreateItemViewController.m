//
//  TDFCreateItemViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFCreateItemViewController.h"
#import <Parse/Parse.h>

@interface TDFCreateItemViewController ()

@end

@implementation TDFCreateItemViewController

@synthesize createItemCompletionBlock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

#pragma mark - Button handlers

- (IBAction)inventoryItemCreateItButtonTouched:(id)sender
{
    PFObject *inventoryItem = [PFObject objectWithClassName:@"InventoryItem"];
    inventoryItem[@"name"] = self.inventoryItemNameTextField.text;
    [inventoryItem save];
    
    createItemCompletionBlock();
    [self.navigationController popViewControllerAnimated:YES];
}

@end
