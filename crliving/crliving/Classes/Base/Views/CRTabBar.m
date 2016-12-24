//
//  CRTabBar.m
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRTabBar.h"

@interface CRTabBar ()

@property (nonatomic, strong) UIButton *centerBt;

@end

@implementation CRTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage imageNamed:@"global_tab_bg"]];
        [self setTintColor:COLOR(179, 153, 93)];
        
        _centerBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerBt setImage:[UIImage imageNamed:@"tab_live_n"] forState:UIControlStateNormal];
        _centerBt.adjustsImageWhenHighlighted = NO;
        [_centerBt sizeToFit];
        [_centerBt addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_centerBt];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat centerWidth = 70;
    Class class = NSClassFromString(@"UITabBarButton");
    CGFloat btWidth = (self.bounds.size.width - centerWidth) / 2;
    CGFloat btIndex = 0;
    for (UIView *child in self.subviews) {
        
        if ([child isKindOfClass:class]) {
            // 设置child的frame
            if (btIndex == 0) {
                child.frame = CGRectMake(0, child.frame.origin.y, btWidth, child.frame.size.height);
            }else if(btIndex == 2){
                child.frame = CGRectMake(btWidth+centerWidth, child.frame.origin.y, btWidth, child.frame.size.height);
            }
            
            // 增加索引
            btIndex++;
            if (btIndex == 1) {
                btIndex++;
            }
            
        }
    }
    
    _centerBt.bounds = CGRectMake(0, 0, centerWidth, centerWidth);
    _centerBt.center = CGPointMake(self.center.x, 14);
}

//响应中间按钮的方法
-(void)centerClick:(UIButton *) bt
{
    [UIView animateWithDuration:0.2 animations:^{
        
        bt.transform = CGAffineTransformMakeScale(1.5, 1.5);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            bt.transform = CGAffineTransformIdentity;
        }];
    }];
    if (_block) {
        _block();
    }
}




//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.centerBt];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.centerBt pointInside:newP withEvent:event]) {
            return self.centerBt;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}


@end
