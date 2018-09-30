//
//  ViewController.m
//  CNTransitionAnimations
//
//  Created by Mac2 on 2018/9/30.
//  Copyright © 2018年 Mac2. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.bounds.size.width / 2 - 40, self.view.bounds.size.height / 2 - 15, 80, 30);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"present" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(presentNewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)presentNewController {
    NewViewController * newVC = [[NewViewController alloc] init];
    [self presentViewController:newVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
