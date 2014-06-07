//
//  ResponseParse.m
//  TWTSideMenuViewController-Sample
//
//  Created by gaowei on 14-6-7.
//  Copyright (c) 2014年 Two Toasters. All rights reserved.
//

#import "ResponseParse.h"

@interface ResponseParse()
@property (strong,nonatomic)NSMutableString *currentElementValue;
@property (strong,nonatomic) NSMutableArray * result;
@property (strong,nonatomic) Top *top;
@end

@implementation ResponseParse
- (NSMutableArray *)parseTopResponse:(NSString *)response
{

    
   // self.result = [[NSMutableArray init]alloc];
    
   response = [response stringByReplacingOccurrencesOfString:@"encoding=\"gb18030\"" withString:@"encoding=\"UTF-8\""];
    NSData *xmlData = [response dataUsingEncoding: NSUTF8StringEncoding];
    self.result = [[NSMutableArray alloc] init];
    self.parser= [[NSXMLParser alloc] initWithData:xmlData];//初始化NSXMLParser对象
    
    [self.parser setDelegate:self];//设置NSXMLParser对象的解析方法代理
    
    //[parser parse];//调用代理解析NSXMLParser对象，看解析是否成功
    
    
    
    bool flag =[self.parser parse];
    if(flag){
      
         NSLog(@"Succeed to parse the XML");
        [self.parser release];
        
    }else{
        
        NSLog(@"Failed to parse the XML");
        
    }
    
    
    
    
    
    
    
    
    return self.result;
    
}




#pragma mark xmlparser

//step 2：准备解析节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
     if([elementName isEqualToString:@"bbstop10"]) {
        //Initialize the array.
         //在这里初始化用于存储最终解析结果的数组变量,我们是在当遇到Books根元素时才开始初始化，有关此初始化过程也可以在parserDidStartDocument 方法中实现
         //self.result = [[NSMutableArray alloc] init];
         }
     else if([elementName isEqualToString:@"top"]) {
        
        //Initialize the book.
        //当碰到Book元素时，初始化用于存储Book信息的实例对象aBook
         _top = [[Top alloc] init];
        
         //Extract the attribute here.
         //从attributeDict字典中读取Book元素的属性
         _top.number = [[attributeDict objectForKey:@"count"] integerValue];
        
         NSLog(@"Reading id value :%i", _top.number);
         }
    
     NSLog(@"Processing Element: %@", elementName);
}
//step 3:获取首尾节点间内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    string  = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    string = [string stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    if(!_currentElementValue)
        _currentElementValue = [[NSMutableString alloc] initWithString:string];
     else
         [_currentElementValue appendString:string];
    
     NSLog(@"Processing Value: %@", _currentElementValue);
}

//step 4 ：解析完当前节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"bbstop10"])
         return;
    
    //There is nothing to do if we encounter the Books element here.
     //If we encounter the Book element howevere, we want to add the book object to the array 遇到Book元素的结束标签，则添加book对象到设置好的数组中。
     // and release the object.
     if([elementName isEqualToString:@"top"]) {
         self.top.title = _currentElementValue;
         [self.result addObject:_top];
        
         [_top release];
         _top = nil;
         
         [_currentElementValue release];
         _currentElementValue = nil;
         return;
        }
    return;
}






- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",[parseError description]);
}





@end
