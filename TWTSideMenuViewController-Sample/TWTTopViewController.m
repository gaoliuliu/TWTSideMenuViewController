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
#import "ResponseParse.h"
#import "TWTPostViewController.h"

static NSString * const kTableViewCellIdentifier = @"com.twotoasters.sampleCell";

@interface TWTTopViewController ()
@property (strong,nonatomic)NSMutableArray * result;
@end

@implementation TWTTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RequestHandler *request  = [[RequestHandler alloc]init];
    ResponseParse *responseParse = [[ResponseParse alloc]init];
    NSString * response= [request grabURL:@"dsfsd"];
    self.result = [responseParse parseTopResponse:response];
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
    return [self.result count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        Top *t = [self.result objectAtIndex:indexPath.row];
              cell.textLabel.text = [NSString stringWithFormat:@"(%i)  %@", t.number,t.title];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTPostViewController new]];
    TWTPostViewController *p = [[controller viewControllers] firstObject];
    p.result= self.result;
    //TWTPostViewController *controller = [[TWTPostViewController alloc] initWithNibName:@"TWTPostViewController" bundle:[NSBundle mainBundle]];
    //controller.result = self.result;
    //[self presentModalViewController:controller animated:YES];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}


@end

