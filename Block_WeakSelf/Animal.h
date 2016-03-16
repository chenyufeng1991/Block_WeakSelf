//
//  Animal.h
//  Block_WeakSelf
//
//  Created by chenyufeng on 16/3/17.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject{

}

@property (nonatomic,strong) void(^animalBlock)(void);
@end
