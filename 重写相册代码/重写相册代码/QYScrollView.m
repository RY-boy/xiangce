//
//  QYScrollView.m
//  重写相册代码
//
//  Created by qingyun on 15/10/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYScrollView.h"

@interface QYScrollView() <UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *imgView;
@end

@implementation QYScrollView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:imageView];
        _imgView =imageView;
        
        //设置自身属性
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 0.5;
        self.delegate = self;
        //添加双击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
        
        
    }
    return self;
}
-(void)doubleClick:(UITapGestureRecognizer *)tap
{
    //当前的缩放比例不为1.0的时候。置为1.0
    if (self.zoomScale !=1.0) {
        self.zoomScale = 1.0;
        return;
    }
    //当前的缩放比例为1.0的时候，放大一个指定的矩形区域
    CGPoint location = [tap locationInView:self];
    CGRect rect =CGRectMake(location.x-100, location.y-100, 200, 200);
    [self zoomToRect:rect animated:YES];
    
    
}
-(void)setImg:(UIImage *)img
{
    _img=img;
    _imgView.image = img;
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

@end
