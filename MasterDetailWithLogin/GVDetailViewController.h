//
//  GVDetailViewController.h
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "DetailViewManager.h"


@interface GVDetailViewController : UIViewController <SubstitutableDetailViewController,UIWebViewDelegate>

//@property (strong, nonatomic) id detailItem;
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

/// SubstitutableDetailViewController
@property(nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
//@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
////@property (nonatomic,weak) IBOutlet UIPopoverController *teamSelectView;
//@property(strong, nonatomic) NSMutableArray *selectedCells;

@property (weak, nonatomic) IBOutlet UIWebView *dashboardView;


//
//@property (nonatomic,weak) IBOutlet UIButton *team1;
//@property (nonatomic,weak) IBOutlet UIButton *team2;
//@property (nonatomic,weak) IBOutlet UIButton *team3;
//@property (nonatomic,weak) IBOutlet UIButton *team4;
//@property (nonatomic,weak) IBOutlet UIView *teamSelect;
//
//
//- (IBAction)dismissView:(id)sender;
//- (IBAction)Team1Select:(id)sender;
//- (IBAction)Team2Select:(id)sender;
//- (IBAction)Team3Select:(id)sender;
//- (IBAction)Team4Select:(id)sender;

@end
