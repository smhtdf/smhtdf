//
//  TDFLookViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFLookViewController.h"
#import "TDFAppDelegate.h"

@interface TDFLookViewController ()

@end

@implementation TDFLookViewController

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

#pragma mark - Core Location handlers

- (void)locationDidChange:(NSNotification *)note
{
    // Extract location key
    CLLocation *location = note.userInfo[@"location"];

    // Set 2km tall region span (NOTE: 111km ~ 1 degree of latitude)
    MKCoordinateSpan span = MKCoordinateSpanMake(0.018, 0.000);
    
    // create region, consisting of span and location
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, span);
    
    // move the map to our location
    [self.lookMap setRegion:region animated:YES];
}

@end
