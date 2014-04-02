//
//  TDFAppDelegate.h
//  TitaniumDragonfly
//
//  Created by Current User on 01/04/2014.
//
//

#import <UIKit/UIKit.h>

static NSString* const kTDFLocationChangeNotification = @"kTDFLocationChangeNotification";
static NSString* const kTDFWorldChangeNotification = @"kTDFWorldChangeNotification";

@interface TDFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
