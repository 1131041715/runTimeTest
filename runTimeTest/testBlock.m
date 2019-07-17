//
//  testBlock.m
//  runTimeTest
//
//  Created by 大碗豆 on 17/11/16.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "testBlock.h"


@implementation testBlock

- (void)testBlock{
    
//    无参数无返回值
    if (self.noHavePmtBlock) {
        self.noHavePmtBlock();
    }
    
    
//  有返回值无参数，相当于正向传值
    self.haveRtnValueNoParameter = ^(){
        return @"123";
    };
    
//    有参数没有返回值，用于逆向传值
    if (self.haveParameterNoRtnValue) {
        self.haveParameterNoRtnValue(12, 15);
    }
    
//    有参数有返回值
    self.haveParameterAndRtnValue = ^NSString *(NSInteger a, NSInteger b) {
        
        NSString *str = [NSString stringWithFormat:@"%zd",a * b];
        
        return str;
    };
}


- (void)parameterIsBlock:(void (^)(NSString *))strBlock{

    strBlock(@"将block作为参数，block的调用（1、在当前方法中调用");
    
}


@end
