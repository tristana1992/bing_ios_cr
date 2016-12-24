//
//  CRBaseViewController.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRBaseViewController.h"

@interface CRBaseViewController ()

@end

@implementation CRBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 基本方法实现


-(void)initData{
    
    
}


-(void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 懒加载

-(UIImageView *)backGroundView{
    if (!_backGroundView) {
        _backGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_bg"]];
        _backGroundView.userInteractionEnabled = YES;
        [_backGroundView sizeToFit];
        [_backGroundView setAlpha:0.1];
    }
    
    return _backGroundView;
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
