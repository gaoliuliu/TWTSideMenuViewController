//
//  RequestHandler.m
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

#import "RequestHandler.h"
#import "ASIHTTPRequest.h"
@implementation RequestHandler

-(NSString *)grabURL:(NSString *)reqUrl
{
    
    NSURL *url = [NSURL URLWithString:@"http://bbs.fudan.edu.cn/bbs/top10"];
    //NSLog(@"Response :%@",@"dsfsdf");
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request startSynchronous];
    
    NSError *error = [request error];
    
    if(!error)
    {
        
        NSString *response = [request responseString];
        NSLog(@"Response :%@",response);
        return response;
    }
    return nil;
}
@end
