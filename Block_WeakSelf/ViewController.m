//
//  ViewController.m
//  Block_WeakSelf
//
//  Created by chenyufeng on 16/3/17.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    void(^myBlock)(void);//该block参数为void，返回值为void
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
    myBlock = ^(void){

        NSLog(@"value:%@,address=%p",self.person,self.person);
    };

    myBlock();
}

- (void)dealloc{

    NSLog(@"%s",__FUNCTION__);
}

@end
