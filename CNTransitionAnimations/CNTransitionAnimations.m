//
//  CNTransitionAnimations.m
//  DisplayTheHandRing
//
//  Created by Mac2 on 2018/9/21.
//  Copyright © 2018年 Mac2. All rights reserved.
//

#import "CNTransitionAnimations.h"
#import "NewViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation CNTransitionAnimations

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_transitionType) {
        case CNTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
        case CNTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
        case CNTransitionTypePush:
            [self pushAnimation:transitionContext];
            break;
        case CNTransitionTypePop:
            [self popAnimation:transitionContext];
            break;
        default:
            break;
    }
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是转场后的VC、fromVC就是转场前的VC
//    FirstViewController *toVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    MainViewController *fromVC = (MainViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //取出转场前后视图控制器上的视图view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    //这里有个重要的概念containerView，如果要对视图做转场动画，视图就必须要加入containerView中才能进行，可以理解containerView管理着所有做转场动画的视图
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
//    [containerView addSubview:fromView];
    
    //从右侧滑出
    toView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    //淡入
//    toView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    toView.alpha = 0.0;
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        toView.alpha = 1.0;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //淡出
//        fromView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
