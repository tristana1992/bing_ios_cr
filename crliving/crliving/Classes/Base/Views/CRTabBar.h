//
//  CRTabBar.h
//  crliving
//
//  Created by Tristana on 2016/12/24.
//  Copyright © 2016年 Tristana. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^centerClickBlock)();

@interface CRTabBar : UITabBar

@property (nonatomic, copy) centerClickBlock block;

@end
