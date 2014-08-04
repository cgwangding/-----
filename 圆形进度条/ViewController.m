//
//  ViewController.m
//  圆形进度条
//
//  Created by 和易讯 on 14-7-25.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import "ViewController.h"
#import "WDCircleProgress.h"
#import "WDCirclePicture.h"

@interface ViewController ()
{
    WDCircleProgress *progress;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    WDCirclePicture *picture = [[WDCirclePicture alloc]initWithCenter:self.view.center andRadius:20 wantImage:[UIImage imageNamed:@"1.png"]];
    [self.view addSubview:picture];

    progress = [[WDCircleProgress alloc]init];
    //设置画圆环的开始位置
    progress.circleProgressType = WDCircleProgressTypeUp;
    //设置画圆环的方向
    progress.isColockwise = YES;
    //根据各个属性开始画
    [progress drawCircleProgressWithCenter:CGPointMake(50, 60) radius:30 lineWidth:5 backgroundColor:[UIColor lightGrayColor] progressColor:[UIColor redColor]];

    [self.view addSubview:progress];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(update)];
    [self.view addGestureRecognizer:tap];
    
//    UIView *circleView = [[UIView alloc]init];
//    circleView.backgroundColor = [UIColor blueColor];
//    [circleView setCenter:CGPointMake(50, 60)];
//    [circleView setFrame:CGRectMake(circleView.center.x-5,circleView.center.y+5, 50, 50)];
//    
//    [circleView.layer setCornerRadius:25];
//    [circleView.layer setMasksToBounds:YES];
//    circleView.layer.borderWidth = 0.1;
//    circleView.layer.borderColor = [UIColor blueColor].CGColor;
//    [self.view addSubview:circleView];
    
    
    
}

-(void)update
{
    [progress updateCircleProgress:0.56];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
