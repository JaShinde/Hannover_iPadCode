
/*

 Hacked up version from Apple's MultipleDetailViews example code:
 
 Original source: https://developer.apple.com/library/IOS/samplecode/MultipleDetailViews/Introduction/Intro.html
 
 */

#import <UIKit/UIKit.h>

@class GVLoadingDetailViewController;
@class GVDetailViewController;
@class IncidentDetailsViewController;
@class WaterDetailsViewController;
@class AirDetailsViewController;
@class WasteDetailsViewController;
@class EnergyDetailsViewController;
/*
 SubstitutableDetailViewController defines the protocol that detail view controllers must adopt.
 The protocol specifies aproperty for the bar button item controlling the navigation pane.
 */
@protocol SubstitutableDetailViewController
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
@end

@interface DetailViewManager : NSObject <UISplitViewControllerDelegate>

/// Things for IB
// The split view this class will be managing.
@property (nonatomic, strong) IBOutlet UISplitViewController *splitViewController;

// The presently displayed detail view controller.  This is modified by the various 
// view controllers in the navigation pane of the split view controller.
@property (nonatomic, assign) IBOutlet UIViewController<SubstitutableDetailViewController> *detailViewController;

// This controller will be displayed whenever we are waiting for data to display.
@property (strong, nonatomic) GVLoadingDetailViewController* loadingDetailViewController;

// This controller will be displayed whenever we have data to display.
@property (strong, nonatomic) GVDetailViewController *loadedDetailViewController;

// This controller will be displayed whenever we have data to display for Incidemtn Details View.
@property (strong, nonatomic) IncidentDetailsViewController* incidentDetails;

// This is the nav controller that will contain the loadedDetailViewController.
@property (strong, nonatomic) UINavigationController *detailNavCtrl;

// This controller will be displayed whenever we have data to display Water Details.
@property (strong, nonatomic) WaterDetailsViewController *waterDetails;

// This controller will be displayed whenever we have data to display Waste Details.
@property (strong, nonatomic) WasteDetailsViewController *wasteDetails;

// This controller will be displayed whenever we have data to display Air Details.
@property (strong, nonatomic) AirDetailsViewController *airDetails;

// This controller will be displayed whenever we have data to display Energy Details.
@property (strong, nonatomic) EnergyDetailsViewController *energyDetails;


@end
