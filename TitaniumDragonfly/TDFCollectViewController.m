//
//  TDFCollectViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFCollectViewController.h"
#import "TDFAppDelegate.h"
#import "TDFCollectItemViewController.h"

@interface TDFCollectViewController ()

@property (strong, nonatomic) PFGeoPoint *geoPoint;

- (void)locationDidChange:(NSNotification *)note;
- (void)worldDidChange:(NSNotification *)note;

@end

@implementation TDFCollectViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationDidChange:) name:kTDFLocationChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(worldDidChange:) name:kTDFWorldChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *identifier = @"TDFCollectTableViewCell";
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = object[@"name"];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowCollectItemViewSegue"]) {
        TDFCollectItemViewController *collectItemViewController = segue.destinationViewController;
        
        PFTableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        collectItemViewController.itemObject = [self objectAtIndexPath:indexPath];
        [collectItemViewController setCollectItemCompletionBlock:^{
            [self loadObjects];
            NSLog(@"objects reloaded\n");
        }];
    }
}

#pragma mark - Parse API

-(PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    if (self.geoPoint) {
        [query whereKey:@"location" nearGeoPoint:self.geoPoint withinKilometers:1.0];
    }
    return query;
}

#pragma mark - Change Notification handlers

- (void)locationDidChange:(NSNotification *)note
{
    self.geoPoint = [PFGeoPoint geoPointWithLocation:note.userInfo[@"location"]];
    [self loadObjects];
}

- (void)worldDidChange:(NSNotification *)note
{
    [self loadObjects];
}

@end
