//
//  XMGuidePageView.h
//  GuidePage
//
//  Created by family on 16/6/30.
//  Copyright © 2016年 family. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGuidePageView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *imagePageControl;

-(instancetype)initWithFrame:(CGRect)frame WithImages:(NSArray *)images;

@end
