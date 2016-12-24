//
//  CRBaseViewController.h
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRBaseViewController : UIViewController

@property (nonatomic, strong) UIImageView *backGroundView;

/**
 初始化参数
 */
-(void)initData;
/**
 初始化布局
 */
-(void)initUI;

@end
