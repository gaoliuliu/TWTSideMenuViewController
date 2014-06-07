//
//  TWTCollectionViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

#import "TWTCollectionViewController.h"
#import "TWTSideMenuViewController.h"
static NSString * const kTableViewCellIdentifier = @"com.twotoasters.sampleCell";

@interface TWTCollectionViewController ()

@end





@implementation TWTCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row + 1];
}

@end

