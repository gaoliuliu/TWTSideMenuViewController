//
//  TWTTopViewController.m
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

//

#import "TWTTopViewController.h"
#import "TWTSideMenuViewController.h"
#import "RequestHandler.h"

static NSString * const kTableViewCellIdentifier = @"com.twotoasters.sampleCell";

@interface TWTTopViewController ()
@end

@implementation TWTTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RequestHandler *request  = [[RequestHandler alloc]init];
    [request grabURL];
    self.title = @"本日十大";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    self.navigationItem.leftBarButtonItem = openItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
    
    
   // [self.request grabURL];
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
{
    return [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row + 1];
    //cell.textLabel.textColor = [UIColor redColor];
}

@end

