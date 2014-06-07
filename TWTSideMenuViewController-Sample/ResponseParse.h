//
//  ResponseParse.h
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Top.h"

@interface ResponseParse : NSObject<NSXMLParserDelegate>
@property (nonatomic,strong) NSXMLParser *parser;



- (NSMutableArray *)parseTopResponse:(NSString *)response;
@end
