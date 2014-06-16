//
//  TDFLookViewController.m
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import "TDFLookViewController.h"
#import "TDFAppDelegate.h"
#import "TDFMapAnnotation.h"
#import <Parse/Parse.h>
#import <Social/Social.h>

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

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults valueForKey:@"name_preference"];
    NSLog(@"Name -> %@", name);
    
    [self setTitle:name];
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
    
    // move
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLocation:note.userInfo[@"location"]];
    PFQuery *query = [PFQuery queryWithClassName:@"GameItem"];
    [query whereKey:@"location" nearGeoPoint:geoPoint withinKilometers:5.0];
    
    NSArray *objArray = [query findObjects];
    {
        id userLocation = [self.lookMap userLocation];
        NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[self.lookMap annotations]];
        NSLog(@"ANNOTATIONS!!!: %@", pins);
        if ( userLocation != nil ) {
            [pins removeObject:userLocation]; // avoid removing user location off the map
        }
        
        [self.lookMap removeAnnotations:pins];
    }
    
    for (NSDictionary *object in objArray) {
        PFGeoPoint *geoPoint = object[@"location"];
        CLLocationCoordinate2D location = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
        TDFMapAnnotation *annotation = [[TDFMapAnnotation alloc] initWithLocation:location];
        [self.lookMap addAnnotation:annotation];
    }
}

- (IBAction)postToSocialViaSL:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        NSString *postText = @"TEST: Hello World";
        
        [composeController setInitialText:postText];
        
        [self presentViewController:composeController animated:YES completion:nil];
    }
    else {
        NSLog(@"Facebook not available");
    }
}

- (IBAction)actionEmailComposer:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Titanium Dragonfly"];
        [mailViewController setMessageBody:@"TEST: Hello world" isHTML:NO];
        [self presentViewController:mailViewController animated:YES completion:nil];
    }
    else {
        NSLog(@"Device is unable to send email in it's current state.");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
