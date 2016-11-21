//
//  JLNavigationController.m
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/21.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "JLNavigationController.h"

@interface JLNavigationController ()

@end

@implementation JLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
