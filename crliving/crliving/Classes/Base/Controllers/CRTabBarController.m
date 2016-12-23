//
//  CRTabBarController.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRTabBarController.h"
#import "CRNavigationController.h"
#import "CRHomeViewController.h"
#import "CRMineViewController.h"
#import "CRLivingViewController.h"
#import "CRTabBar.h"
@interface CRTabBarController ()

@end

@implementation CRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initlayouts];
}

-(void)initlayouts
{
    CRNavigationController *homeNav = [[CRNavigationController alloc] initWithRootViewController:[[CRHomeViewController alloc] init]];
    homeNav.tabBarItem = [self tabBarItemWithImage:[UIImage imageNamed:@"tab_home_n"] selectedImage:[UIImage imageNamed:@"tab_home_s"] title:@"首页"];
    
    CRNavigationController *mineNav = [[CRNavigationController alloc] initWithRootViewController:[[CRMineViewController alloc] init]];
    mineNav.tabBarItem = [self tabBarItemWithImage:[UIImage imageNamed:@"tab_mine_n"] selectedImage:[UIImage imageNamed:@"tab_mine_s"] title:@"我的"];
    
    self.viewControllers = @[homeNav,mineNav];
    
    CRTabBar *crtab = [[CRTabBar alloc] init];
    crtab.block = ^(){
        CRLivingViewController *livingVC = [[CRLivingViewController alloc] init];
        NSLog(@"livingVC:%@",livingVC);
        [self presentViewController:livingVC animated:YES completion:nil];
    };
    [self setValue:crtab forKey:@"tabBar"];
    
    [self setSelectedIndex:1];
}


-(UITabBarItem *)tabBarItemWithImage:(UIImage *) normalImage selectedImage:(UIImage *) selectedImage title:(NSString *) title{
    UITabBarItem *item = [[UITabBarItem alloc] init];
    [item setImage:normalImage];
    [item setSelectedImage:selectedImage];
    [item setTitle:title];
    return item;
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
