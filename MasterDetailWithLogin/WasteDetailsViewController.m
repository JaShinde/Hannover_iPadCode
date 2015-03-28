//
//  WasteDetailsViewController.m
//  eNIM
//
//  Created by 179159 on 27/03/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

#import "WasteDetailsViewController.h"

@interface WasteDetailsViewController ()

@end

@implementation WasteDetailsViewController

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

#pragma mark -
#pragma mark SubstitutableDetailViewController

// -------------------------------------------------------------------------------
//	setNavigationPaneBarButtonItem:
//  Custom implementation for the navigationPaneBarButtonItem setter.
//  In addition to updating the _navigationPaneBarButtonItem ivar, it
//  reconfigures the toolbar to either show or hide the
//  navigationPaneBarButtonItem.
// -------------------------------------------------------------------------------
- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem
{
    [self.navigationItem setLeftItemsSupplementBackButton:YES];
    if (navigationPaneBarButtonItem != _navigationPaneBarButtonItem) {
        if (navigationPaneBarButtonItem) {
            [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObject:navigationPaneBarButtonItem]  animated:NO];
        } else {
            [self.navigationItem setLeftBarButtonItem:nil animated:NO];
        }
        _navigationPaneBarButtonItem = navigationPaneBarButtonItem;
    }
}

@end
