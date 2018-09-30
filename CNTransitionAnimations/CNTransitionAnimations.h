//
//  CNTransitionAnimations.h
//  DisplayTheHandRing
//
//  Created by Mac2 on 2018/9/21.
//  Copyright © 2018年 Mac2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CNTransitionType) {
    CNTransitionTypePresent = 0,
    CNTransitionTypeDismiss,
    CNTransitionTypePush,
    CNTransitionTypePop
};

@interface CNTransitionAnimations : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CNTransitionType transitionType;

@end
