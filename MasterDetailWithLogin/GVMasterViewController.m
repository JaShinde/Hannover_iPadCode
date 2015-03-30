//
//  GVMasterViewController.m
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import "GVMasterViewController.h"
#import "GVDetailViewController.h"
#import "GVLoginViewController.h"
#import "GVLoadingDetailViewController.h"
#import "GVAppDelegate.h"
#import "IncidentDetailsViewController.h"
#import "WaterDetailsViewController.h"
#import "WasteDetailsViewController.h"
#import "AirDetailsViewController.h"
#import "EnergyDetailsViewController.h"


@interface GVMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation GVMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        self.detailViewManager = [[DetailViewManager alloc] init];
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;


    if (!_objects) {
           _objects = [[NSMutableArray alloc] init];
        }
            [_objects insertObject:[NSString stringWithFormat:@"Incident Reporting"] atIndex:0];
            [_objects insertObject:[NSString stringWithFormat:@"Energy"] atIndex:1];
            [_objects insertObject:[NSString stringWithFormat:@"Waste"] atIndex:2];
            [_objects insertObject:[NSString stringWithFormat:@"Air"] atIndex:3];
            [_objects insertObject:[NSString stringWithFormat:@"Water"] atIndex:4];
            [_objects insertObject:[NSString stringWithFormat:@"Incidents"] atIndex:5];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
   
        // store the "normal" detail view and its containing nav controller as props for future convenience.
        self.detailViewManager.loadedDetailViewController = (GVDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        self.detailViewManager.detailNavCtrl = (UINavigationController *) [self.splitViewController.viewControllers lastObject];
        
        // tell the mgr about the detail, so buttons get added if needed.  We default with the loadedDetailViewController.
        self.detailViewManager.detailViewController = self.detailViewManager.loadedDetailViewController;
        
// Comment this line purposefully
// load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.loadingDetailViewController = (GVLoadingDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"LoadingDetailViewController"];
        [self.detailViewManager.loadingDetailViewController view]; // force the outlets to be bound.

        // load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.incidentDetails = (IncidentDetailsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"IncidentDetails"];
        [self.detailViewManager.incidentDetails view]; // force the outlets to be bound.

        
        // load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.waterDetails = (WaterDetailsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"waterDetails"];
        [self.detailViewManager.waterDetails view]; // force the outlets to be bound.
        
        // load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.wasteDetails = (WasteDetailsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"wasteDetails"];
        [self.detailViewManager.wasteDetails view]; // force the outlets to be bound.

        // load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.energyDetails = (EnergyDetailsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"energyDetails"];
        [self.detailViewManager.energyDetails view]; // force the outlets to be bound.
        
        // load up the alternate loading detail... we'll need it shortly!
        self.detailViewManager.airDetails = (AirDetailsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"airDetails"];
        [self.detailViewManager.airDetails view]; // force the outlets to be bound.

        
    }
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(![(GVAppDelegate*)[[UIApplication sharedApplication] delegate] authenticated])
    {
        NSLog(@"not authenticated, put up login screen.");
        UIStoryboard *storyboard;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
        } else {
            storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        }
        GVLoginViewController *vc =  (GVLoginViewController*)[storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [vc setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:vc animated:NO completion:nil];
    }


}

//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//- (void)insertNewObject:(id)sender
//{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    
//    // on iPad, when we add our first item we want to force the detail page
//    // to reload if necessary.
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        if(_objects.count == 1) {
//            self.detailViewManager.loadedDetailViewController.detailItem = [_objects objectAtIndex:0];
//            self.detailViewManager.detailViewController = self.detailViewManager.loadedDetailViewController;
//        }
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // TODO: do we really need this?
    // on iPad, replace the loading detail view if we now have  data.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        UIViewController *vc = [self.splitViewController.viewControllers lastObject];
        if((_objects.count > 0) && ([vc class] ==  [GVLoadingDetailViewController class])) {
         //   NSLog(@"We have data, replacing detail view with normal view.");
            self.detailViewManager.detailViewController = self.detailViewManager.loadedDetailViewController;
        }
    }
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 125)]; // your cell's height should be greater than 48 for this.
    imgView.tag = 1;
    [cell.contentView addSubview:imgView];
    imgView = nil;

    UIImageView *_imgView = (UIImageView *)[cell.contentView viewWithTag:1];
    _imgView.image = [UIImage imageNamed:@"album-bb.jpg"]; // repace the same with array of imwage names.
//    
//    
//    NSString *object = _objects[indexPath.row];
//    cell.textLabel.text = [object description];
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//        // on iPad, after delete if we have no data, we switch back to our loading detail view.
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//            if(_objects.count == 0 )
//            {
//                self.detailViewManager.detailViewController = self.detailViewManager.loadingDetailViewController;
//            }
//        }
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}
/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    switch (row) {
        case 0:
        {
            self.detailViewManager.detailViewController = self.detailViewManager.loadedDetailViewController;
            break;
        }
        case 1:{
            self.detailViewManager.detailViewController = self.detailViewManager.energyDetails;
            break;
        }
        case 2:{
            self.detailViewManager.detailViewController = self.detailViewManager.wasteDetails;
            break;
        }
        case 3:{
            self.detailViewManager.detailViewController = self.detailViewManager.airDetails;
            break;
        }
        case 4:{
            self.detailViewManager.detailViewController = self.detailViewManager.waterDetails;
            break;
        }
        case 5:{
            self.detailViewManager.detailViewController = self.detailViewManager.incidentDetails;
            break;
        }
            
        default:
        {
            self.detailViewManager.detailViewController = self.detailViewManager.loadedDetailViewController;
            break;
        }
        
    }
    
//    self.detailViewManager.detailViewController = self.detailViewManager.incidentDetails;
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        
//        NSDate *object = _objects[indexPath.row];
//        self.detailViewManager.loadedDetailViewController.detailItem = object;
//    }
}


@end
