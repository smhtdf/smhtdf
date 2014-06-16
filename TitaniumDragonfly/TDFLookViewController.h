//
//  TDFLookViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface TDFLookViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *lookMap;
- (void)locationDidChange:(NSNotification *)note;
- (IBAction)postToSocialViaSL:(id)sender;
- (IBAction)actionEmailComposer:(id)sender;

@end
