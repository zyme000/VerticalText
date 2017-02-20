//
//  ViewController.m
//  VerticalText
//
//  Created by ran zhang on 16/8/26.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "ViewController.h"
#import "VerticalText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    VerticalText *v = [[VerticalText alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
    v.backgroundColor  = [UIColor whiteColor];
    v.strShowText = @"白日依山尽，\n黄河入海流，\n欲穷千里目，\n更上一层楼asdfqwertyuiop[asd\n\nfghj\n\nkl;'zxc\n\nvbn\nm,\n.wertyui";
    v.layoutStyle = MiddleBottom;
    v.orderStyle = FromRightToLeft;
    
    [self.view addSubview:v];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
