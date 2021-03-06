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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"top_user_info@2x.png"];
    button.frame = CGRectMake(0, 0, 150, 33);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = addButton;

    
}

- (void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:YES];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"waste" ofType:@"html" inDirectory:nil];
    NSLog(@"%@",filePath);
    //    NSString *htmlstring=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.dashboardView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
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
