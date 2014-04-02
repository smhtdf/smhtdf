//
//  TDFCollectItemViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFCollectItemViewController.h"
#import "TDFAppDelegate.h"

@interface TDFCollectItemViewController ()

@end

@implementation TDFCollectItemViewController

@synthesize collectItemCompletionBlock;

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
    self.inventoryItemNameLabel.text = self.itemObject[@"name"];
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

#pragma mark - Button handlers

- (IBAction)inventoryItemCollectItButtonTouched:(id)sender
{
    PFObject *inventoryItem = [PFObject objectWithClassName:@"InventoryItem"];
    inventoryItem[@"name"] = self.itemObject[@"name"];
    [inventoryItem save];
    [self.itemObject delete];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTDFWorldChangeNotification object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kTDFInventoryChangeNotification object:nil userInfo:nil];
    
    collectItemCompletionBlock();
    [self.navigationController popViewControllerAnimated:YES];
}

@end
