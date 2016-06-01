//
//  ViewController.m
//  CycleScrollView
//
//  Created by tom.sun on 16/6/1.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollView.h"

@interface ViewController ()<CycleScrollViewDelegate,CycleScrollViewDatasource>
@property (nonatomic, strong) CycleScrollView *scrollView;
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArray = @[@"1",@"2",@"3",@"4"];
    _scrollView = [[CycleScrollView alloc]initWithFrame:CGRectMake(10, 100, [[UIScreen mainScreen]bounds].size.width - 20, 200)];
    _scrollView.delegate = self;
    _scrollView.datasource = self;
    _scrollView.animationDuration = 4;
    [self.view addSubview:_scrollView];
}

- (NSInteger)numberOfPages
{
    return _imageArray.count;
}

- (UIView *)pageAtIndex:(NSInteger)index size:(CGSize)size
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width , _scrollView.frame.size.height)];
    imageView.image = [UIImage imageNamed:_imageArray[index]];
    return imageView;
}

- (void)scrollView:(CycleScrollView *)scrollView didClickPage:(UIView *)view atIndex:(NSInteger)index
{
    NSLog(@"你点的是第%d个",(int)index + 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
