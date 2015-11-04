//
//  ViewController.m
//  重写相册代码
//
//  Created by qingyun on 15/10/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建并添加滚动的底部的scrollview
    [self addScrollView];
    //在底部的scrollView上添加缩放的scrollView
    [self addSubViewForScrollView];
    
}
//创建并添加滚动的底部的ScrollView
-(void)addScrollView
{
    UIScrollView *scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + 25, QYScreenH)];
    [self.view addSubview:scrollView];
    
    //contentSize
    scrollView.contentSize = CGSizeMake((QYScreenW + 25)*3, QYScreenH);
    
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.delegate = self;
    _scrollView =scrollView;
    _scrollView.backgroundColor = [UIColor redColor];
}
//在底部的ScrollView上添加缩放的ScrollView
-(void)addSubViewForScrollView
{
    for (int i = 0; i < 3; i++) {
        QYScrollView *qyscrollView=[[QYScrollView alloc]initWithFrame:CGRectMake((QYScreenW +25) *i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:qyscrollView];
        NSString *imageName =[NSString stringWithFormat:@"%d.jpg",i+1];
        //通过属性设置
        qyscrollView.img = [UIImage imageNamed:imageName];
    }
}
//减速完成  把上个界面的缩放的scrollview缩放比例设置1.0
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id scroll in scrollView.subviews) {
        //判断scroll对象是否是QYScrollView类型的
        if ([scroll isKindOfClass:[QYScrollView class]]) {
            QYScrollView *qyScrollView = (QYScrollView *)scroll;
            //设置缩放比例
            qyScrollView.zoomScale = 1.0;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
