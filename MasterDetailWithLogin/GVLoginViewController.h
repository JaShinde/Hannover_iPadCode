//
//  GVLoginViewController.h
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVMasterViewController.h"




@interface GVLoginViewController : UIViewController<UITextFieldDelegate>
{
  //  IBOutlet UIButton *loginButton;
//    IBOutlet UITextField *userName;
//    IBOutlet UITextField *userPassword;
    
}

@property (nonatomic,strong) IBOutlet UITextField *userName;
@property (nonatomic,strong) IBOutlet UITextField *userPassword;


@end
