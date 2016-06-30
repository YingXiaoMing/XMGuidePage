//
//  XMGuidePageView.m
//  GuidePage
//
//  Created by family on 16/6/30.
//  Copyright © 2016年 family. All rights reserved.
//

#import "XMGuidePageView.h"
#define XMWidth [UIScreen mainScreen].bounds.size.width
#define XMHeight [UIScreen mainScreen].bounds.size.height
@implementation XMGuidePageView
-(instancetype)initWithFrame:(CGRect)frame WithImages:(NSArray *)images
{
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [[UIScrollView alloc]init];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.bounces = NO;
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = [UIColor greenColor];
        self.scrollView.frame = frame;
        self.scrollView.contentSize = CGSizeMake(images.count * XMWidth, 0);
        
        [self addSubview:self.scrollView];
        //引导页面的跳过按钮
        UIButton *skinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        skinBtn.backgroundColor = [UIColor lightGrayColor];
        [skinBtn setTitle:@"跳过" forState:UIControlStateNormal];
        skinBtn.frame = CGRectMake(XMWidth * 0.8 , XMWidth * 0.1, 50, 25);
        skinBtn.layer.cornerRadius = 5;
        [skinBtn addTarget:self action:@selector(skin) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:skinBtn];
        //添加图片资源到ScrollView上
        NSLog(@"%ld",images.count);
        for (int i = 0; i < images.count; i++) {
            UIImageView *image = [[UIImageView alloc]initWithImage:images[i]];
            image.frame = CGRectMake(XMWidth * i, 0, XMWidth, XMHeight);
            [self.scrollView addSubview:image];
            //添加体验按钮
            if (i == images.count - 1) {//如果是最后一张
                UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                startBtn.frame = CGRectMake(XMWidth * 0.3, XMHeight * 0.8, XMWidth * 0.4, 50);
                [startBtn setTitle:@"开始体验" forState:UIControlStateNormal];
                startBtn.backgroundColor = [UIColor orangeColor];
                startBtn.titleLabel.font = [UIFont systemFontOfSize:21];
                [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
                [image addSubview:startBtn];
            }
        }
        //添加imagePageControl
        self.imagePageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(XMWidth * 0.1 - 20, XMHeight * 0.9, XMWidth * 0.9, 50)];
        self.imagePageControl.currentPage = 0;
        self.imagePageControl.numberOfPages = images.count;
        self.imagePageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        self.imagePageControl.pageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:self.imagePageControl];
    }
    return self;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / XMWidth;
    [self.imagePageControl setCurrentPage:page];
}
-(void)skin
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }];
    [self performSelector:@selector(start) withObject:nil afterDelay:1];
}
-(void)start
{
    [self removeFromSuperview];
}
@end
