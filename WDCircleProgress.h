//
//  WDCircleProgress.h
//  圆形进度条
//
//  Created by 和易讯 on 14-7-25.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义圆环进度条的开始时的位置
typedef NS_ENUM(NSInteger, WDCircleProgressType) {
    WDCircleProgressTypeUp = 0,
    WDCircleProgressTypeDown,
    WDCircleProgressTypeLeft,
    WDCircleProgressTypeRight
};

//@protocol WDCircleProgressDelegate <NSObject>
//
//-(void)updateCircleProgress:(float)progress;
//
//@end

@interface WDCircleProgress : UIView
{
    CAShapeLayer *progressLayer;
}


@property (nonatomic,assign) WDCircleProgressType circleProgressType; //圆环进度条开始的位置


//@property (nonatomic,strong) UIColor *backgroundColor; //圆环进度条背景颜色
//
//@property (nonatomic,strong) UIColor *progressColor; //圆环进度条的颜色

@property (nonatomic,assign) BOOL isColockwise;//是否是顺时针进行画圆，yes为是
//
//@property (nonatomic,assign) float progress; //0~1之间的数
//
//@property (nonatomic,assign) float progressWidth; //圆形进度条的宽度

-(void)drawCircleProgressWithCenter:(CGPoint)center
                             radius:(CGFloat)radius
                          lineWidth:(CGFloat)width
                    backgroundColor:(UIColor*)bgColor
                      progressColor:(UIColor*)proColor;

-(void)updateCircleProgress:(float)progress;


@end
