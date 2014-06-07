//
//  TWTMenuViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by Josh Johnson on 8/14/13.
//  Copyright (c) 2013 Two Toasters. All rights reserved.
//

#import "TWTMenuViewController.h"
#import "TWTMainViewController.h"
#import "TWTTopViewController.h"
#import "TWTCollectionViewController.h"
#import "TWTSideMenuViewController.h"

@interface TWTMenuViewController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation TWTMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy"]];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGRect imageViewRect = [[UIScreen mainScreen] bounds];
    imageViewRect.size.width += 589;
    self.backgroundImageView.frame = imageViewRect;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.backgroundImageView];

    NSDictionary *viewDictionary = @{ @"imageView" : self.backgroundImageView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    
    UIButton *classButton = [UIButton buttonWithType:UIButtonTypeSystem];
    classButton.frame = CGRectMake(10.0f, 100.0f, 200.0f, 44.0f);
    [classButton setBackgroundColor:[UIColor whiteColor]];
    [classButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [classButton setTitle:@"分类讨论" forState:UIControlStateNormal];
    [classButton addTarget:self action:@selector(classButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:classButton];
    
    UIButton *topButton = [UIButton buttonWithType:UIButtonTypeSystem];
    topButton.frame = CGRectMake(10.0f, 150.0f, 200.0f, 44.0f);
    [topButton setBackgroundColor:[UIColor whiteColor]];
    [topButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [topButton setTitle:@"本日十大" forState:UIControlStateNormal];
    [topButton addTarget:self action:@selector(topButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topButton];
    
    
    UIButton *collectionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    collectionButton.frame = CGRectMake(10.0f, 200.0f, 200.0f, 44.0f);
    [collectionButton setBackgroundColor:[UIColor whiteColor]];
    [collectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [collectionButton setTitle:@"我的收藏" forState:UIControlStateNormal];
    [collectionButton addTarget:self action:@selector(collectionButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionButton];

    UIButton *mailButton = [UIButton buttonWithType:UIButtonTypeSystem];
    mailButton.frame = CGRectMake(10.0f, 250.0f, 200.0f, 44.0f);
    [mailButton setBackgroundColor:[UIColor whiteColor]];
    [mailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mailButton setTitle:@"我的信箱" forState:UIControlStateNormal];
    [mailButton addTarget:self action:@selector(classButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mailButton];
    
    UIButton *accountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    accountButton.frame = CGRectMake(10.0f, 300.0f, 200.0f, 44.0f);
    [accountButton setBackgroundColor:[UIColor whiteColor]];
    [accountButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [accountButton setTitle:@"我的账户" forState:UIControlStateNormal];
    [accountButton addTarget:self action:@selector(classButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:accountButton];
    //UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //changeButton.frame = CGRectMake(10.0f, 200.0f, 200.0f, 44.0f);
    //[changeButton setTitle:@"Swap" forState:UIControlStateNormal];
    //[changeButton setBackgroundColor:[UIColor greenColor]];
    //[changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[changeButton addTarget:self action:@selector(changeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:changeButton];
}

- (void)changeButtonPressed
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTMainViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}

- (void)topButtonPressed
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTTopViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}

- (void)collectionButtonPressed
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTCollectionViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}
- (void)classButtonPressed
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTMainViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
