//
//  TDFInventoryViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFInventoryViewController.h"
#import "TDFCreateItemViewController.h"
#import "TDFDropItemViewController.h"
#import "TDFAppDelegate.h"

@interface TDFInventoryViewController ()

- (void)inventoryDidChange:(NSNotification *)note;

@end

@implementation TDFInventoryViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inventoryDidChange:) name:kTDFInventoryChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *identifier = @"TDFInventoryTableViewCell";
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = object[@"name"];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[self objectAtIndexPath:indexPath] delete];
        [self loadObjects];
    }
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"ShowDropItemViewSegue"]) {
        TDFAppDelegate *appD = [UIApplication sharedApplication].delegate;
        if (!appD.locationManager.location) {
            return NO;
        }
    }
    
    return YES;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowCreateItemViewSegue"]) {
        TDFCreateItemViewController *createItemViewController = segue.destinationViewController;
        [createItemViewController setCreateItemCompletionBlock:^{
            [self loadObjects];
        }];
    }
    else if ([segue.identifier isEqualToString:@"ShowDropItemViewSegue"]) {
        TDFDropItemViewController *dropItemViewController = segue.destinationViewController;
        TDFAppDelegate *appD = [UIApplication sharedApplication].delegate;
        dropItemViewController.geoPoint = [PFGeoPoint geoPointWithLocation:appD.locationManager.location];
        
        PFTableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        dropItemViewController.itemObject = [self objectAtIndexPath:indexPath];
        [dropItemViewController setDropItemCompletionBlock:^{
            [self loadObjects];
        }];
    }
}

#pragma mark - Parse API

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

#pragma mark - Change Notification handlers

- (void)inventoryDidChange:(NSNotification *)note
{
    [self loadObjects];
}

@end
