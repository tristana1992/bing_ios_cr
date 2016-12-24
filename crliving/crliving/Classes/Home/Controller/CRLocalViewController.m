//
//  CRLocalViewController.m
//  crliving
//
//  Created by Tristana on 2016/12/25.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRLocalViewController.h"

@interface CRLocalViewController ()

@end

@implementation CRLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}

-(void)initUI{
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"初始化附近");
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
