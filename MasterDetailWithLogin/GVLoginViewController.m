//
//  GVLoginViewController.m
//  MasterDetailWithLogin
//
//  Created by Jonathan Engelsma on 9/6/13.
//  Copyright (c) 2013 Jonathan Engelsma. All rights reserved.
//

#import "GVLoginViewController.h"
#import "GVAppDelegate.h"
#import "btRippleButtton.h"


@interface GVLoginViewController ()

@end


@implementation GVLoginViewController

@synthesize userName,userPassword;

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
    BTRippleButtton *rippleButton = [[BTRippleButtton alloc]initWithImage:[UIImage imageNamed:@"login.jpg"]
                                                                 andFrame:CGRectMake(450, 500, 60, 60)
                                                                andTarget:@selector(loginPressed:)
                                                                    andID:self];
    [rippleButton setRippeEffectEnabled:NO];
//    [rippleButton setRippleEffectWithColor:[UIColor colorWithRed:240/255.f green:159/255.f blue:10/255.f alpha:1]];
    [self.view addSubview:rippleButton];

    CGRect layerFrame = CGRectMake(0, 0, self.userName.frame.size.width, self.userName.frame.size.height);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
//    CGPathAddLineToPoint(path, NULL, layerFrame.size.width, 0); // top line
    CGPathMoveToPoint(path, NULL, 0, layerFrame.size.height);
    CGPathAddLineToPoint(path, NULL, layerFrame.size.width, layerFrame.size.height); // bottom line
    CAShapeLayer * line = [CAShapeLayer layer];
    line.path = path;
    line.lineWidth = 2;
    line.frame = layerFrame;
    line.strokeColor = [UIColor blackColor].CGColor;
    
    [self.userName.layer addSublayer:line];
    
        layerFrame = CGRectMake(0, 0, self.userPassword.frame.size.width, self.userPassword.frame.size.height);
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    //    CGPathAddLineToPoint(path, NULL, layerFrame.size.width, 0); // top line
    CGPathMoveToPoint(path, NULL, 0, layerFrame.size.height);
    CGPathAddLineToPoint(path, NULL, layerFrame.size.width, layerFrame.size.height); // bottom line
    line = [CAShapeLayer layer];
    line.path = path;
    line.lineWidth = 2;
    line.frame = layerFrame;
    line.strokeColor = [UIColor blackColor].CGColor;
    [self.userPassword.layer addSublayer:line];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
    // once login button is pressed, we update our global authentication flag. 
    GVAppDelegate *ad = (GVAppDelegate*)[[UIApplication sharedApplication] delegate];
    ad.authenticated = YES;
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
