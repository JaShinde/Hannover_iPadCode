//
//  WaterDetailsViewController.h
//  eNIM
//
//  Created by 179159 on 27/03/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "DetailViewManager.h"

@interface WaterDetailsViewController : UIViewController<SubstitutableDetailViewController,UIWebViewDelegate>


@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIWebView *dashboardView;

@end
