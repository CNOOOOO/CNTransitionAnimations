//
//  NewViewController.m
//  CNTransitionAnimations
//
//  Created by Mac2 on 2018/9/30.
//  Copyright © 2018年 Mac2. All rights reserved.
//

#import "NewViewController.h"
#import "CNTransitionAnimations.h"

@interface NewViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) CNTransitionAnimations *transAnimation;

@end

@implementation NewViewController

- (instancetype)init {
    if (self == [super init]) {
        self.transAnimation.transitionType = CNTransitionTypePresent;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (CNTransitionAnimations *)transAnimation {
    if (!_transAnimation) {
        _transAnimation = [[CNTransitionAnimations alloc] init];
        self.transitioningDelegate = self;
    }
    return _transAnimation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 35, 80, 30);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backPreView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)backPreView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.transAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transAnimation.transitionType = CNTransitionTypeDismiss;
    return self.transAnimation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
