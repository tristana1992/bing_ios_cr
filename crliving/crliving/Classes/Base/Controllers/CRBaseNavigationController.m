//
//  CRBaseNavigationController.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRBaseNavigationController.h"

@interface CRBaseNavigationController ()

@end

@implementation CRBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationBar.barTintColor = color(42, 42, 55);
    //[self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self changeNavBackGroundImage];
    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.tintColor = [UIColor whiteColor];
}


-(void)changeNavBackGroundImage{
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"nav_bg_%i",RANDOMNUM(12)+1]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
