//
//  GVDetailViewController.m
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import "GVDetailViewController.h"
#import "GVLoginViewController.h"
#import "GVLoadingDetailViewController.h"
#import "GVAppDelegate.h"

@interface GVDetailViewController (){
//@property (strong, nonatomic) UIPopoverController *masterPopoverController;
//- (void)configureView;
    NSMutableArray *_selectedCells;
}
@end

@implementation GVDetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        [self configureView];
//    }
//
//    if (self.masterPopoverController != nil) {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }        
//}

//- (void)configureView
//{
//    // Update the user interface for the detail item.
//
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}

- (void)insertNewObject{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    if (!_selectedCells) {
        _selectedCells = [[NSMutableArray alloc] init];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"top_user_info@2x.png"];
    button.frame = CGRectMake(0, 0, 150, 33);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    [_selectedCells insertObject:[NSString stringWithFormat:@"user2@2x.png"] atIndex:0];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user3@2x.png"] atIndex:1];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user4@2x.png"] atIndex:2];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user7@2x.png"] atIndex:3];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user8@2x.png"] atIndex:4];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user9@2x.png"] atIndex:5];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user10@2x.png"] atIndex:6];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user11@2x.png"] atIndex:7];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user5@2x.png"] atIndex:8];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user6@2x.png"] atIndex:9];
    [_selectedCells insertObject:[NSString stringWithFormat:@"user12@2x.png"] atIndex:10];

    
//    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageWithContentsOfFile: @"background_view.png"]];
 
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection view data source


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

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}

- (void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

    
}

-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{


}

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
