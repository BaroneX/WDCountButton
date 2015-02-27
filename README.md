# WDCountButton

倒计时按钮
  
    WDCountButton* wdbut = [[WDCountButton alloc]initWithFrame:CGRectMake(0, 0, 260, 106/2.8)];
    wdbut.countTime = 6;
    wdbut.center = CGPointMake(self.view.center.x, 100);
    //    wdbut.nomaelColor = [UIColor redColor];
    //    wdbut.countColor = [UIColor blueColor];
    wdbut.countImage = [UIImage imageNamed:@"countImage.png"];
    wdbut.nomalImage = [UIImage imageNamed:@"nomalImage.png"];
    [self.view addSubview:wdbut];
    
 ![](https://github.com/CrazyCodeMan/WDCountButton/raw/master/sample.png)
