//
//  CRLivingViewController.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRLivingViewController.h"

@interface CRLivingViewController ()

@end

@implementation CRLivingViewController

//SingletonM(LivingVC);


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

-(void)initData{
    
}

-(void)initUI{
    UIButton *backBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    backBt.backgroundColor = [UIColor redColor];
    [backBt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBt];
}


-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)dealloc{
    NSLog(@"直播页面销毁了!");
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
