//
//  CRHomeViewController.m
//  crliving
//
//  Created by Tristana on 2016/12/25.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRHomeViewController.h"
#import "CRAttentionViewController.h"
#import "CRHotViewController.h"
#import "CRLocalViewController.h"
#import "CRHomeTopView.h"

@interface CRHomeViewController ()<UIScrollViewDelegate,CRTopViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) NSDictionary *itemData;
@property (strong, nonatomic) NSArray *topTitles;

@property (strong, nonatomic) CRHomeTopView *topHomeView;

@end

@implementation CRHomeViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}


//视图已经出现后执行
-(void)viewDidAppear:(BOOL)animated{
    [self loadHotView];
}

#pragma mark - 基本配置
/**
 初始化数据
 */
-(void)initData{
    self.topTitles = @[@"关注",@"热门",@"附近"];
    
    self.itemData = [NSDictionary dictionaryWithObjects:@[@"CRAttentionViewController",@"CRHotViewController",@"CRLocalViewController"] forKeys:self.topTitles];
    
    //将子控制器添加到当前控制器中
    for (int i = 0; i<self.topTitles.count; i++) {
        NSString *vcName = [self.itemData objectForKey:self.topTitles[i]];
        Class class = NSClassFromString(vcName);
        UIViewController *vc = [[class alloc] init];
        vc.title = self.topTitles[i];
        [self addChildViewController:vc];
    }
}


/**
 初始化布局
 */
-(void)initUI{
    [self setupNav];
    
    //设置mainScrollView
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    self.mainScrollView.delegate = self;
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*self.topTitles.count, 0);
    self.mainScrollView.bounces = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    
    
    
}

/**
 配置导航栏
 */
-(void)setupNav{
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_message"] style:UIBarButtonItemStyleDone target:self action:@selector(message)];
    self.navigationItem.titleView = self.topHomeView;
}

/**
 首次进入初始化热门页面
 */
-(void)loadHotView{
    CGFloat vWidth = SCREEN_WIDTH;
    CGFloat vHeight = SCREEN_HEIGHT;
    NSLog(@"%f",vWidth);
    
    CGFloat offsetX = self.mainScrollView.contentOffset.x;
    
    NSUInteger index = offsetX/vWidth;
    UIViewController *vc = self.childViewControllers[index];
    
    if ([vc isViewLoaded]) {
        return;
    }
    vc.view.frame = CGRectMake(offsetX, 0, vWidth, vHeight);
    [self.mainScrollView addSubview:vc.view];
}

#pragma mark - topView的代理方法

-(void)topHomeView:(CRHomeTopView *)topView didSelectIndex:(NSUInteger)index{
    NSLog(@"%ld",index);
    UIButton *bt = [topView viewWithTag:100+index];
    [UIView animateWithDuration:0.25 animations:^{
        topView.lineView.centerX = bt.centerX;
        
        //关联scrollView
        _mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
    }];
    
    
    [self scrollViewDidEndDecelerating:_mainScrollView];
    
}


/**
 减速结束的时候调用加载子视图控制器view的方法
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat vWidth = SCREEN_WIDTH;
    CGFloat vHeight = SCREEN_HEIGHT;
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSUInteger index = offsetX/vWidth;
    
    //关联topView
    UIButton *bt = [self.topHomeView viewWithTag:100+index];
    [UIView animateWithDuration:0.25 animations:^{
        self.topHomeView.lineView.centerX = bt.centerX;
    }];
    
    
    UIViewController *vc = self.childViewControllers[index];
    
    if ([vc isViewLoaded]) {
        return;
    }
    vc.view.frame = CGRectMake(offsetX, 0, vWidth, vHeight);
    [scrollView addSubview:vc.view];
    
}




#pragma mark - 懒加载

-(CRHomeTopView *)topHomeView{
    if (!_topHomeView) {
        _topHomeView = [[CRHomeTopView alloc] initWithFrame:CGRectMake(0, 0, 180, 44) titleNames:self.topTitles];
        _topHomeView.delegate = self;
        
    }
    
    return _topHomeView;
}


#pragma mark - 按钮触发的方法

-(void)search{
    NSLog(@"search...");
}

-(void)message{
    NSLog(@"message...");
}



#pragma mark - 重写父类的方法

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)dealloc
{
    NSLog(@"主页销毁了！！！");
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
