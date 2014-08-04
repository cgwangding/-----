//
//  WDCircleProgress.m
//  圆形进度条
//
//  Created by 和易讯 on 14-7-25.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import "WDCircleProgress.h"


@implementation WDCircleProgress

//-(id)init
//{
//    if (self = [super init]) {
//        typeArray = [[NSMutableArray alloc]init];
//    }
//    return self;
//}

-(void)drawCircleProgressWithCenter:(CGPoint)center
                             radius:(CGFloat)radius
                          lineWidth:(CGFloat)width
                    backgroundColor:(UIColor*)bgColor
                      progressColor:(UIColor*)proColor
{
//    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:self.center radius:20 startAngle:M_PI endAngle:M_PI_2 clockwise:YES];
//    [bezier fill];
    CAShapeLayer *backgroundLayer = [self createLayerWithCenter:center radius:radius lineWidth:width color:bgColor];
    [self.layer addSublayer:backgroundLayer];
    
    progressLayer = [self createLayerWithCenter:center radius:radius lineWidth:width color:proColor];
    progressLayer.strokeEnd = 0;
    [self.layer addSublayer:progressLayer];
    

}

//返回一个层，
-(CAShapeLayer*)createLayerWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)width color:(UIColor*)color
{
    //创建一个路径
    UIBezierPath *path;
    switch (_circleProgressType) {
        case WDCircleProgressTypeUp:
            path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:M_PI + M_PI_2 clockwise:_isColockwise];

            break;
        case WDCircleProgressTypeDown:
             path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:M_PI_2 endAngle: -1.5*M_PI clockwise:_isColockwise];
            break;
        case WDCircleProgressTypeLeft:
        {
           path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI endAngle:M_PI clockwise:_isColockwise];
        }
            break;
        case WDCircleProgressTypeRight:
            
            path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:_isColockwise];            break;
        default:
            break;
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(center.x - radius, center.y - radius, radius* 2, radius *2);
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.lineWidth = width;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineJoin = kCALineJoinBevel;
    shapeLayer.path = path.CGPath;
    return shapeLayer;
}

-(void)updateCircleProgress:(float)progress
{
    progressLayer.strokeEnd = progress;
}


@end
