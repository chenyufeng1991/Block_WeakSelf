//
//  ViewController.m
//
//
//  Created by chenyufeng on 16/3/17.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"

@interface ViewController (){

    void(^myBlock1)(void);//该block参数为void，返回值为void
    void(^myBlock2)(void);
    void(^myBlock3)(void);
}

@property (nonatomic,copy) NSString *person;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self testFunc];
}

- (void)testFunc{

    self.person = @"jack";

    //关于weakSelf有好几种不同的写法
    __weak typeof(self) weakSelf = self;
    NSLog(@"init--> value:%@,address=%p,self=%p",self.person,self.person,self);

    myBlock1 = ^(void){
        //这样不会造成循环引用
        NSLog(@"execute1--> value:%@,address=%p,weakSelf=%p",weakSelf.person,weakSelf.person,weakSelf);
    };

    myBlock2 = ^(void){
        //这样造成循环引用
        NSLog(@"execute2--> value:%@,address=%p,self=%p",self.person,self.person,self);
    };

    myBlock3 = ^(void){
        //这样也不会造成循环引用,已经抽取出要执行的方法
        [weakSelf myBlock3Func];
    };


    //block不是self的属性时，block内部使用self也不是循环引用
    Animal *animal = [[Animal alloc] init];
    animal.animalBlock = ^(void){

        NSLog(@"animal--> value:%@,address=%p,self=%p",self.person,self.person,self);
    };

    myBlock1();
    myBlock2();
    myBlock3();

    animal.animalBlock();    
}

- (void)myBlock3Func{

    NSLog(@"execute3--> value:%@,address=%p,self=%p",self.person,self.person,self);
}

@end










