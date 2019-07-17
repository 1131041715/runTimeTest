//
//  NSObject+CategoryWithProperty.m
//  runTimeTest
//
//  Created by 大碗豆 on 17/11/9.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "NSObject+CategoryWithProperty.h"
#import <objc/runtime.h>

@implementation NSObject (CategoryWithProperty)

- (NSObject *)property {
    
    return objc_getAssociatedObject(self, @selector(property));
    
}

- (void)setProperty:(NSObject *)value {
    
    objc_setAssociatedObject(self, @selector(property), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)test {
    NSLog(@"这是一个分类");
}
@end
