//
//  GVAppDelegate.h
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewManager.h"

//@class DetailViewManager;

@interface GVAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) BOOL authenticated;
@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) DetailViewManager *detailViewManager;

@end
