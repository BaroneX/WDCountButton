//
//  WDCountButton.h
//  WDFrameWork
//
//  Created by Blake on 14/8/7.
//  Copyright (c) 2014年 BLAKE. All rights reserved.
//

#import <UIKit/UIKit.h>


#define NomalTitle @""

@protocol WDCountButtonDelegate <NSObject>
/**
 *  按钮点击的代理事件,不设置自动调用倒计时方法,设置后需要手动调用
 */
-(void)countButtonClicked;

@end

@interface WDCountButton : UIButton
/**
 *  设置代理需要手动调用countDown方法,
 *  不设置代理自动调用countDown方法
 */
@property(nonatomic,weak)id<WDCountButtonDelegate> countButtonDlegate;

@property(nonatomic)int countTime;//计时时间

@property(nonatomic,strong)UIImage* nomalImage;//正常状态的背景

@property(nonatomic,strong)UIImage* countImage;//计时状态的背景

@property(nonatomic,strong)UIColor* nomaelColor;//正常状态的背景颜色

@property(nonatomic,strong)UIColor* countColor;//计时状态的背景颜色

/**
 *  开始倒计时方法
 */
-(void)countDown;
/**
 *  停止倒计时方法
 */
-(void)stopCountDown;

@end
