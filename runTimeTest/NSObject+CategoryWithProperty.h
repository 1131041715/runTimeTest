//
//  NSObject+CategoryWithProperty.h
//  runTimeTest
//
//  Created by 大碗豆 on 17/11/9.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CategoryWithProperty)

///给分类动态添加属性（利用runtime）
@property (nonatomic, strong) NSString *property;

- (void)test;

@end
