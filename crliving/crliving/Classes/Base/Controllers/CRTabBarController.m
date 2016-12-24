//
//  CRTabBarController.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRTabBarController.h"
#import "CRBaseNavigationController.h"
#import "CRHomeViewController.h"
#import "CRMineViewController.h"
#import "CRLivingViewController.h"
#import "CRTabBar.h"
@interface CRTabBarController ()<UITabBarDelegate>

@property (nonatomic, assign) NSUInteger itemIndex;

@end

@implementation CRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initlayouts];
}

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}


#pragma mark - 配置TabBarController
/**
 配置tabBarController
 */
-(void)initlayouts
{
    _itemIndex = 100;
    CRHomeViewController *homeVC = [[CRHomeViewController alloc] init];
    CRBaseNavigationController *homeNav = [[CRBaseNavigationController alloc] initWithRootViewController:homeVC];
    UITabBarItem * homeItem = [self tabBarItemWithImage:[UIImage imageNamed:@"tab_home_n"] selectedImage:[UIImage imageNamed:@"tab_home_s"] title:@"首页" tag:_itemIndex];
    homeVC.tabBarItem = homeItem;
    
    CRMineViewController *mineVC = [[CRMineViewController alloc] init];
    CRBaseNavigationController *mineNav = [[CRBaseNavigationController alloc] initWithRootViewController:mineVC];
    UITabBarItem * mineItem = [self tabBarItemWithImage:[UIImage imageNamed:@"tab_mine_n"] selectedImage:[UIImage imageNamed:@"tab_mine_s"] title:@"我的" tag:_itemIndex+1];
    mineVC.tabBarItem = mineItem;
    
    [self addChildViewController:homeNav];
    [self addChildViewController:mineNav];
    
    CRTabBar *crtab = [[CRTabBar alloc] init];
    crtab.delegate = self;
    crtab.block = ^(){
        CRLivingViewController *livingVC = [[CRLivingViewController alloc] init];
        [self presentViewController:livingVC animated:YES completion:nil];
    };
    [self setValue:crtab forKey:@"tabBar"];
    
}
/**
 配置UITabBarItem
 */
-(UITabBarItem *)tabBarItemWithImage:(UIImage *) normalImage selectedImage:(UIImage *) selectedImage title:(NSString *) title tag:(NSUInteger) tag{
    UITabBarItem *item = [[UITabBarItem alloc] init];
    [item setImage:normalImage];
    [item setSelectedImage:selectedImage];
    [item setTitle:title];
    item.tag = tag;//通过tag
    return item;
}



#pragma mark - UITabBar的delgate方法
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    Class class = NSClassFromString(@"UITabBarButton");
    NSUInteger index = _itemIndex;
    for (UIView *child in tabBar.subviews) {
        
        if ([child isKindOfClass:class]) {
            if (index == item.tag) {
                
                for (UIView *bt in [child subviews]) {
                    if ([bt isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        [UIView animateWithDuration:0.2 animations:^{
                            
                            bt.transform = CGAffineTransformMakeScale(1.2, 1.2);
                            
                        } completion:^(BOOL finished) {
                            
                            [UIView animateWithDuration:0.2 animations:^{
                                
                                bt.transform = CGAffineTransformIdentity;
                            }];
                        }];
                        return;
                    }
                }
            }
            index++;
        }
    }
    
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
