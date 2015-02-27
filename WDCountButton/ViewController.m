//
//  ViewController.m
//  WDCountButton
//
//  Created by Blake on 15/2/27.
//  Copyright (c) 2015年 Blake. All rights reserved.
//

#import "ViewController.h"
#import "WDCountButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WDCountButton* wdbut = [[WDCountButton alloc]initWithFrame:CGRectMake(0, 0, 260, 106/2.8)];
    wdbut.countTime = 6;
    wdbut.center = CGPointMake(self.view.center.x, 100);
    //    wdbut.nomaelColor = [UIColor redColor];
    //    wdbut.countColor = [UIColor blueColor];
    wdbut.countImage = [UIImage imageNamed:@"MS_AgainSendLift.png"];
    wdbut.nomalImage = [UIImage imageNamed:@"MS_AgainSendPressed.png"];
    [self.view addSubview:wdbut];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
