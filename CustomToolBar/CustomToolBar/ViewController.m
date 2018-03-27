//
//  ViewController.m
//  CustomToolBar
//
//  Created by 陈鹏 on 2018/3/26.
//  Copyright © 2018年 jasonchen. All rights reserved.
//

#import "ViewController.h"
#import "CustomToolBar.h"
#import "CustomToolBarItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomToolBar *toolBar = [[CustomToolBar alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds), 300)];
    toolBar.tintColor = [UIColor blueColor];
    toolBar.backgroundColor = [UIColor grayColor];
    
    CustomToolBarItem *btn1 = [CustomToolBarItem customButtonType:CustomButtonTypeTitle];
    btn1.backgroundColor = [UIColor greenColor];
    btn1.title = @"btn1";
    
    CustomToolBarItem *btn2 = [CustomToolBarItem customButtonType:CustomButtonTypeImage];
    btn2.backgroundColor = [UIColor greenColor];
    btn2.icon = [UIImage imageNamed:@"yHeart"];
    
    CustomToolBarItem *btn3 = [CustomToolBarItem customButtonType:CustomButtonTypeImage];
    btn3.backgroundColor = [UIColor greenColor];
    btn3.icon = [UIImage imageNamed:@"gHeart"];
    
    toolBar.items = @[btn1, btn2, btn3];
    
    [self.view addSubview:toolBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
