//
//  TDFDropItemViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFDropItemViewController.h"
#import "TDFAppDelegate.h"

@interface TDFDropItemViewController ()

@end

@implementation TDFDropItemViewController

@synthesize dropItemCompletionBlock;

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

- (IBAction)inventoryItemDropItButtonTouched:(id)sender
{
    PFObject *gameItem = [PFObject objectWithClassName:@"GameItem"];
    gameItem[@"name"] = self.itemObject[@"name"];
    gameItem[@"location"] = self.geoPoint;
    [gameItem save];
    [self.itemObject delete];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kTDFWorldChangeNotification object:nil userInfo:nil];
    
    dropItemCompletionBlock();
    [self.navigationController popViewControllerAnimated:YES];
}

@end
