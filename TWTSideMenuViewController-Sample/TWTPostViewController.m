//
//  TWTPostViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

#import "TWTPostViewController.h"
#import "TWTSideMenuViewController.h"
#import "Top.h"

static NSString * const kTableViewCellIdentifier = @"com.twotoasters.sampleCell";
@interface TWTPostViewController ()

@end
@implementation TWTPostViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"帖子";
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    return [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Top *t = [self.result firstObject];
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", t.title];
}

@end
