//
//  WDCountButton.m
//  WDFrameWork
//
//  Created by Blake on 14/8/7.
//  Copyright (c) 2014年 BLAKE. All rights reserved.
//

#import "WDCountButton.h"

@interface WDCountButton ()
{

    dispatch_source_t _timer;
}

@end

@implementation WDCountButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initButton];
          }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initButton];
    }
    return self;
}
-(void)initButton{

    [self setTitle:NomalTitle forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(countClicked) forControlEvents:UIControlEventTouchUpInside];

}
-(void)setNomalImage:(UIImage *)nomalImage{

    _nomalImage = nomalImage;
     [self setBackgroundImage:nomalImage forState:UIControlStateNormal];

}
-(void)setNomaelColor:(UIColor *)nomaelColor{
    
    _nomaelColor = nomaelColor;
    self.backgroundColor = nomaelColor;

}

-(void)countClicked{

    //设置代理执行代理方法不会执行倒计时
    //无代理时自动执行倒计时
    if ([self.countButtonDlegate respondsToSelector:@selector(countButtonClicked)]) {
        [self.countButtonDlegate countButtonClicked];//执行代理方法
    }else{
        
        [self countDown];
    }

}
-(void)countDown{
    
    __block int timeout=self.countTime; //倒计时时间
    if (self.countImage) {
        [self setBackgroundImage:self.countImage forState:UIControlStateNormal];
    }else if (self.countColor){
        self.backgroundColor = self.countColor;
    }
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:NomalTitle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                if (self.nomalImage) {
                    [self setBackgroundImage:self.nomalImage forState:UIControlStateNormal];
                }else if (self.nomaelColor){
                    self.backgroundColor = self.nomaelColor;
                }
                
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 600;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置

                [self setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

-(void)stopCountDown {
    
    if (_timer) {
        dispatch_source_cancel(_timer);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //设置界面的按钮显示 根据自己需求设置
        [self setTitle:@"" forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        if (self.nomalImage) {
            [self setBackgroundImage:self.nomalImage forState:UIControlStateNormal];
        }else if (self.nomaelColor){
            self.backgroundColor = self.nomaelColor;
        }
        
    });
    
}

@end
