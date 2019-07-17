//
//  testBlock.h
//  runTimeTest
//
//  Created by 大碗豆 on 17/11/16.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
   typedef定义block（无参数无返回值）
 */
typedef void (^noHaveParameter)(void);

//typedef NSString * (^haveParameter)(void);


@interface testBlock : NSObject


- (void)testBlock;

@property (nonatomic, strong) noHaveParameter noHavePmtBlock;

/**
 有返回值没有参数
 */
@property (nonatomic, strong) NSString *(^haveRtnValueNoParameter)(void);

/**
 有参数没有返回值
 */
@property (nonatomic, strong) void(^haveParameterNoRtnValue)(NSInteger a, NSInteger b);

/**
 有参数有返回值
 */
@property (nonatomic, strong) NSString *(^haveParameterAndRtnValue)(NSInteger a, NSInteger b);

- (void)parameterIsBlock:(void (^)(NSString *str))strBlock;


@end














