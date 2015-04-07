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

   // self.teamSelect.hidden = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    if (!self.selectedCells) {
        self.selectedCells = [[NSMutableArray alloc] init];
    }
    
    //    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    //    tapGesture.delaysTouchesBegan = YES;
    //    tapGesture.numberOfTapsRequired = 2;
    //    [self.collectionView addGestureRecognizer:tapGesture];
    
    UILongPressGestureRecognizer* longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongGesture:)];
    longGesture.delaysTouchesBegan = YES;
    longGesture.numberOfTouchesRequired = 1;
    
    [self.collectionView addGestureRecognizer:longGesture];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"top_user_info@2x.png"];
    button.frame = CGRectMake(0, 0, 150, 33);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    [_selectedCells insertObject:[NSString stringWithFormat:@"user7@2x.png"] atIndex:0];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user1@2x.png"] atIndex:1];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user2@2x.png"] atIndex:2];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user3@2x.png"] atIndex:3];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user10@2x.png"] atIndex:4];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user4@2x.png"] atIndex:5];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user11@2x.png"] atIndex:6];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user5@2x.png"] atIndex:7];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user8@2x.png"] atIndex:8];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user12@2x.png"] atIndex:9];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user9@2x.png"] atIndex:10];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user6@2x.png"] atIndex:11];
    
    
    //    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageWithContentsOfFile: @"background_view.png"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    //    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
}

- (void)handleLongGesture:(UILongPressGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        if(indexPath.row == 1) {
            // get the cell at indexPath (the one you long pressed)
            UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
            //    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
            recipeImageView.image = [UIImage imageNamed:@"user1_selected@2x.png"];
            [_selectedCells replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"user1_selected@2x.png"]];
            // do stuff with the cell
            [self.collectionView reloadData];
            self.teamSelect.hidden = NO;
            
            
        }
    }
    
     
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
   // self.view.superview.bounds = CGRectMake(0, 0,720, 100);
    NSLog(@"Will Will Appear");
    self.teamSelect.hidden = YES;
    
    [_selectedCells replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"user7@2x.png"]];
    [_selectedCells replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"user1@2x.png"]];
    [_selectedCells replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"user2@2x.png"]];
    [_selectedCells replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"user3@2x.png"]];
    [_selectedCells replaceObjectAtIndex:4 withObject:[NSString stringWithFormat:@"user10@2x.png"]];
    [_selectedCells replaceObjectAtIndex:5 withObject:[NSString stringWithFormat:@"user4@2x.png"]];
   
    
    
    [_selectedCells replaceObjectAtIndex:6 withObject:[NSString stringWithFormat:@"user11@2x.png"]];
    [_selectedCells replaceObjectAtIndex:7 withObject:[NSString stringWithFormat:@"user5@2x.png"]];
    [_selectedCells replaceObjectAtIndex:8 withObject:[NSString stringWithFormat:@"user8@2x.png"]];
    
    
    
    [_selectedCells replaceObjectAtIndex:9 withObject:[NSString stringWithFormat:@"user12@2x.png"]];
       [_selectedCells replaceObjectAtIndex:10 withObject:[NSString stringWithFormat:@"user9@2x.png"]];
    [_selectedCells replaceObjectAtIndex:11 withObject:[NSString stringWithFormat:@"user6@2x.png"]];
    
    [self.collectionView reloadData];
}


- (IBAction)dismissView:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NO];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_selectedCells count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"IncidentPhotoCell" forIndexPath:indexPath];
    
    //    ALAsset *asset = self.assets[indexPath.row];
    //cell.asset = asset;
    cell.backgroundColor = [UIColor whiteColor];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    recipeImageView.image = [UIImage imageNamed:[_selectedCells objectAtIndex:indexPath.row]];
    
    return cell;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}


- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if(indexPath.row == 0){
    //    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"IncidentPhotoCell" forIndexPath:indexPath];
    //
    //    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //    //    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    //    recipeImageView.image = [UIImage imageNamed:@"user1_selected@2x.png"];
    //
    //
    //    [_selectedCells replaceObjectAtIndex:indexPath.row withObject:[NSString stringWithFormat:@"user1_selected@2x.png"]];
    //
    //        [self.collectionView reloadData];
    //    }
    
//    TeamSelectionViewController *myController =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"teamSelection"];
//    
//    [self.navigationController pushViewController:myController animated:YES];
//    // [myController release];
    
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
    
    
    [self.selectedCells replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"user1_selectedonly@2x.png"]];
    
    [self.collectionView reloadData];
    
    self.teamSelect.hidden = YES;
    
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
    
    [self.selectedCells replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"user1_selectedonly@2x.png"]];
    
    [self.collectionView reloadData];
    
    self.teamSelect.hidden = YES;
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
    [self.selectedCells replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"user1_selectedonly@2x.png"]];
    
    [self.collectionView reloadData];
    
    self.teamSelect.hidden = YES;
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
    [self.selectedCells replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"user1_selectedonly@2x.png"]];
    
    [self.collectionView reloadData];
    self.teamSelect.hidden = YES;
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
