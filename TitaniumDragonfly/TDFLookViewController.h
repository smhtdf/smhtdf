//
//  TDFLookViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 02/04/2014.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TDFLookViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *lookMap;
- (void)locationDidChange:(NSNotification *)note;

@end
