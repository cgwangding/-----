//
//  WDCirclePicture.h
//  圆形进度条
//
//  Created by 和易讯 on 14-7-25.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDCirclePicture : UIView

//初始化位置，大小，以及使用的图片
-(id)initWithCenter:(CGPoint)center andRadius:(int)radius wantImage:(UIImage*)img;
//设置图片的边框大小，以及边框的颜色，不设置时默认为边框1，颜色红
-(void)setPictureBorderWidth:(CGFloat)width andColor:(UIColor*)color;
//使用16进制颜色，格式为（0XFFFFFF或者#ABDEFC）
-(void)setPictureBorderWidth:(CGFloat)width withHexString:(NSString *)colorString;
@end
