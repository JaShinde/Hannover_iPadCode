//
//  WasteDetailsViewController.h
//  eNIM
//
//  Created by 179159 on 27/03/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewManager.h"

@interface WasteDetailsViewController : UIViewController<SubstitutableDetailViewController>


@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end
