//
//  ViewController.m
//  UITouch
//
//  Created by zh dk on 2017/8/23.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = CGRectMake(50, 100, 220, 300);
    imageView.tag = 101;
    [self.view addSubview:imageView];
    
}

//当点击屏幕开始的瞬间调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取点击对象，anyObject获取任何一个点击对象。一般情况下只有一个点击对象
    UITouch *touch = [touches anyObject];
    //记录当前点击的次数
    if (touch.tapCount == 1) {
        NSLog(@"单次点击");
    }
    else if (touch.tapCount==2){
        NSLog(@"双次点击");
    }
    
    mPlLast = [touch locationInView:self.view];
//    NSLog(@"手指触碰屏幕瞬间");
    
}

//手指在屏幕上时调用。并且移动数据可以获取
-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    //获取当前手指在屏幕上的坐标
    CGPoint pt = [touch locationInView:self.view];
    //每次移动的偏移量
    float xoffSet = pt.x - mPlLast.x;
    float yoffSet = pt.y - mPlLast.y;
    
    NSLog(@"x = %f,y = %f",pt.x,pt.y);
    
    UIImageView *imageView = [self.view viewWithTag:101];
    mPlLast = pt;
    imageView.frame = CGRectMake(imageView.frame.origin.x+xoffSet,
                                 imageView.frame.origin.y+yoffSet
                                 , imageView.frame.size.width,
                                 imageView.frame.size.height);
    
//    NSLog(@"手指在屏幕上，并且移动");
}

//手指离开屏幕时调用
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"手指离开屏幕");
}

//在特殊情况下中断屏幕事件时调用
-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触屏事件被打断");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
