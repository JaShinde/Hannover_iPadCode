//
//  TeamSelectionViewController.h
//  eNIM
//
//  Created by 179159 on 02/04/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVDetailViewController.h"


@interface TeamSelectionViewController : UIViewController
{


}

@property (strong, nonatomic) GVDetailViewController *detailViewController;
@property (nonatomic,weak) IBOutlet UIButton *team1;
@property (nonatomic,weak) IBOutlet UIButton *team2;
@property (nonatomic,weak) IBOutlet UIButton *team3;
@property (nonatomic,weak) IBOutlet UIButton *team4;


- (IBAction)dismissView:(id)sender;
- (IBAction)Team1Select:(id)sender;
- (IBAction)Team2Select:(id)sender;
- (IBAction)Team3Select:(id)sender;
- (IBAction)Team4Select:(id)sender;

@end
