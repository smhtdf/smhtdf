//
//  TDFCDInventoryViewController.h
//  TitaniumDragonfly
//
//  Created by Current User on 23/04/2014.
//
//

#import <UIKit/UIKit.h>

@interface TDFCDInventoryViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) NSArray *inventoryItems;

@end
