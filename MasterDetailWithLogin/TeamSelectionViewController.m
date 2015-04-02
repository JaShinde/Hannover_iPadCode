//
//  TeamSelectionViewController.m
//  eNIM
//
//  Created by 179159 on 02/04/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

#import "TeamSelectionViewController.h"



@interface TeamSelectionViewController ()

@end

@implementation TeamSelectionViewController

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
//      self.view.superview.frame = CGRectMake(0, 500, 720,100);
   // self.view.superview.bounds = CGRectMake(0, 0,720, 100);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.view.superview.bounds = CGRectMake(0, 0,720, 100);
    
  
    
}


- (IBAction)dismissView:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NO];
}


- (IBAction)Team1Select:(id)sender{

    [self.team1 setImage:[UIImage imageNamed:@"team1_active@2x.png"]
              forState:UIControlStateNormal];
    [self.team2 setImage:[UIImage imageNamed:@"team2@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team3 setImage:[UIImage imageNamed:@"team3@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team4 setImage:[UIImage imageNamed:@"team4@2x.png"]
           forState:UIControlStateNormal];

    self.detailViewController = (GVDetailViewController *)[[self.splitViewController.viewControllers firstObject] topViewController];
    
    [self.detailViewController.selectedCells replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"user1_selectedonly@2x.png"]];

    [self.detailViewController.collectionView reloadData];
    
//    [self dismissViewControllerAnimated:YES completion:NO];
    
}

- (IBAction)Team2Select:(id)sender{
    
    [self.team2 setImage:[UIImage imageNamed:@"team2_active@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team1 setImage:[UIImage imageNamed:@"team1@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team3 setImage:[UIImage imageNamed:@"team3@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team4 setImage:[UIImage imageNamed:@"team4@2x.png"]
           forState:UIControlStateNormal];

}

- (IBAction)Team3Select:(id)sender{
    
    [self.team3 setImage:[UIImage imageNamed:@"team3_active@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team1 setImage:[UIImage imageNamed:@"team1@2x.png"]
                forState:UIControlStateNormal];
    
    [self.team2 setImage:[UIImage imageNamed:@"team2@2x.png"]
                forState:UIControlStateNormal];
    
    [self.team4 setImage:[UIImage imageNamed:@"team4@2x.png"]
                forState:UIControlStateNormal];
}

- (IBAction)Team4Select:(id)sender{
    
    [self.team4 setImage:[UIImage imageNamed:@"team4_active@2x.png"]
           forState:UIControlStateNormal];
    
    [self.team1 setImage:[UIImage imageNamed:@"team1@2x.png"]
                forState:UIControlStateNormal];
    
    [self.team2 setImage:[UIImage imageNamed:@"team2@2x.png"]
                forState:UIControlStateNormal];
    
    [self.team3 setImage:[UIImage imageNamed:@"team3@2x.png"]
                forState:UIControlStateNormal];

    
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

@end
