//
//  ViewController.m
//  runTimeTest
//
//  Created by 大碗豆 on 17/11/9.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>//添加运行时文件

#import "NSObject+CategoryWithProperty.h"
#import "ViewController+VC.h"

#import "testBlock.h"

const NSString *associatedKey = @"associate_nsarray_with_nsstring_key";//设置key
@interface ViewController ()

@property (nonatomic, strong) testBlock *blockTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [btn setTitle:@"点我试试" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
//    UIImageView *imgView = [[UIImageView alloc] init];
//    imgView.image = [UIImage imageNamed:@"rp"];
//    [btn addSubview:imgView];
//    imgView.frame = CGRectMake(60, 10, 30, 30);
    
    
//    block测试
    self.blockTest = [testBlock new];
   
}


- (void)btnAction{
    
    [self testNslogn];
    
//    [self testRunTimeRelevanceObj];
    
//    [self runTimeAddProperty];
    
//    [self categoryTest];
    
//    [self extensionTest];
    
//    [self allBlockTest];
    
}



/**
 block测试
 */
- (void)allBlockTest{
//    [self.blockTest testBlock];
    
//    [self.blockTest setNoHavePmtBlock:^{
//        NSLog(@"~~~~无返回值无参数block测试~~~~~");
//    }];
//
//    NSLog(@"%@~~~~~有返回值无参数block测试，相当于正向传值~~~~",self.blockTest.haveRtnValueNoParameter());
//
//    [self.blockTest setHaveParameterNoRtnValue:^(NSInteger a, NSInteger b) {
//        NSLog(@"%ld~~~~有参数没有返回值block测试，用于逆向传值~~~~~",a + b);
//    }];
//
//    NSLog(@"%@~~~~~有参数有返回值block测试~~~~",self.blockTest.haveParameterAndRtnValue(4,5));
   
    [self.blockTest parameterIsBlock:^(NSString *str) {

        NSLog(@"%@~~~~~~~~~",str);
    }];
}



///类扩展测试
- (void)extensionTest{
    
    self.stringExtension = @"给扩展里面定义的属性字符串赋值";
    NSLog(@"定义的属性String是:%@", self.stringExtension);
    
    //类扩展里面方法实现
    [self testExtension];
}

- (void)testExtension{
    NSLog(@"%@~~~~类扩展里面的方法实现~~~~~",NSStringFromSelector(_cmd));
}

///分类测试
- (void)categoryTest{
    
//    NSString *str = [NSString new];
//    [str test];
    
    NSObject *obj = [NSObject new];
    [obj test];
    
}


///动态向NSObject中添加属性
- (void)runTimeAddProperty{
    
    NSObject *obj = [[NSObject alloc] init];
    obj.property = @"123";
    
    NSLog(@"%@~~~~~~~~~",obj.property);
}

///例如：使用runtime把一个NSString对象关联到一个NSArray对象上
- (void)testRunTimeRelevanceObj{
    NSArray *array = [NSArray arrayWithObjects:@"111", @"222", @"333", nil];
    NSString *string = @"woshishuzi";
    // 将string关联到array上 四个参数：1、源对象 2、关联关键字 3、关联的对象 4、关联方式（关联策略）
    objc_setAssociatedObject(array, &associatedKey, string, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 从array中获取被关联的对象string
    NSString *getAssociatedObject = objc_getAssociatedObject(array, &associatedKey);//string已经变成array的一个属性了
    NSLog(@"%@", getAssociatedObject);//输出结果：woshishuzi
}


///_cmd表示当前方法的selector的一个指针，self表示指向当前对象的一个指针. 比如，我们要打印当前要调用的方法，可以这样来写
- (void)testNslogn{
    NSLog(@"Current method: %@ %@",[self class],NSStringFromSelector(_cmd));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
