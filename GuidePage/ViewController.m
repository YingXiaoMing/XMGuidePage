//
//  ViewController.m
//  GuidePage
//
//  Created by family on 16/6/30.
//  Copyright © 2016年 family. All rights reserved.
//

#import "ViewController.h"
#import "XMGuidePageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"meili.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"meinv.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"image3.jpg"];
    
    NSArray *imageCount = @[image1,image2,image3,image4];
    
    XMGuidePageView *pageView = [[XMGuidePageView alloc]initWithFrame:self.view.bounds WithImages:imageCount];
    [self.view addSubview:pageView];
}


@end
