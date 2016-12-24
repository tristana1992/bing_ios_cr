//
//  CRHomeTopView.m
//  crliving
//
//  Created by Tristana on 2016/12/25.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import "CRHomeTopView.h"

@interface CRHomeTopView ()



@end

@implementation CRHomeTopView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *) titles
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        CGFloat btWidth = self.width/titles.count;
        CGFloat btHeight = self.height;
        for (int i = 0; i<titles.count; i++) {
            UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.tag = 100+i;
            [bt setTitle:titles[i] forState:UIControlStateNormal];
            [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            bt.titleLabel.font = [UIFont systemFontOfSize:17];
            bt.frame = CGRectMake(btWidth*i, 0, btWidth, btHeight);
            [bt addTarget:self action:@selector(clickBt:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:bt];
            
            if (i == 1) {
                CGFloat lineWidth = 35;
                CGFloat lineHeight = 3;
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.width = lineWidth;
                self.lineView.height = lineHeight;
                self.lineView.top = (self.height-17)/2.0+20;
                self.lineView.centerX = bt.centerX;
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}


-(void)clickBt:(UIButton *) bt{
    
    NSUInteger index = bt.tag-100;
    //使用代理
    if ([self.delegate respondsToSelector:@selector(topHomeView: didSelectIndex:)]) {
        [self.delegate topHomeView:self didSelectIndex:index];
    }
    
    
    
}



@end
