//
//  CRHomeTopView.h
//  crliving
//
//  Created by Tristana on 2016/12/25.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRHomeTopView;

@protocol CRTopViewDelegate <NSObject>

-(void)topHomeView:(CRHomeTopView *) topView didSelectIndex:(NSUInteger) index;

@end

@interface CRHomeTopView : UIView

@property (strong, nonatomic) UIView *lineView;
@property (weak, nonatomic) id<CRTopViewDelegate> delegate;


- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *) titles;



@end
