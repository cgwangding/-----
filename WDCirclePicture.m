//
//  WDCirclePicture.m
//  圆形进度条
//
//  Created by 和易讯 on 14-7-25.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import "WDCirclePicture.h"

@implementation WDCirclePicture

//初始化它的位置大小
-(id)initWithCenter:(CGPoint)center andRadius:(int)radius wantImage:(UIImage*)img
{
    if (self = [super init]) {
        self = [[WDCirclePicture alloc]init];
        [self setCenter:center];
        [self setFrame:CGRectMake(center.x - radius,center.y - radius , radius*2, radius*2)];
        [self.layer setCornerRadius:radius];
        [self.layer setMasksToBounds:YES];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor redColor]CGColor];
        self.layer.contents = (id)[img CGImage];
    }
    return self;
}

//设置边框的颜色和宽度
-(void)setPictureBorderWidth:(CGFloat)width andColor:(UIColor*)color
{
    self.layer.borderWidth = width;
    if (color != nil) {
        self.layer.borderColor = [color CGColor];
    }
}

//使用16进制颜色，格式为（0XFFFFFF或者#ABDEFC）
-(void)setPictureBorderWidth:(CGFloat)width withHexString:(NSString *)colorString
{
    self.layer.borderWidth = width;
    self.layer.borderColor = [[self colorWithHexString:colorString] CGColor];
    
}

-(UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
