//
//  BarLineChart.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarLineChart.h"
#import <UIKit/UIKit.h>

@interface BarLineChart ()

//@property (nonatomic, strong) NSMutableArray *chartPath;
@property (nonatomic, strong) CAShapeLayer *chartLine;
@property (nonatomic, strong) CAGradientLayer *lineGradientLayer;
@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation BarLineChart

- (void)strokeChart{
    self.lineGradientLayer.frame = self.bounds;
    self.chartLine.frame = self.bounds;
//    self.chartLine.backgroundColor = UIColor.redColor.CGColor;
//    [self addSublayer:self.lineGradientLayer];
    [self.bezierPath removeAllPoints];
    
    NSInteger num = [self.dataSource numberOfBarLineChart:self];
    if (num==0) {
        return;
    }
    BarLineChartDataItem *Item = self.chartData.getData(0);
    [self.bezierPath moveToPoint:Item.point];
    for (int i = 0; i < num-1; i++) {
        CGPoint p1 = self.chartData.getData(i).point;
        CGPoint p2 = self.chartData.getData(i+1).point;
        NSLog(@"+++++++%@",[NSValue valueWithCGPoint:p1]);
        CGPoint midPoint = [BarLineChart midPointBetweenPoint1:p1 andPoint2:p2];
        [self.bezierPath addQuadCurveToPoint:midPoint controlPoint:[BarLineChart controlPointBetweenPoint1:midPoint andPoint2:p1]];
        [self.bezierPath addQuadCurveToPoint:p2 controlPoint:[BarLineChart controlPointBetweenPoint1:midPoint andPoint2:p2]];
    }
    self.chartLine.path = self.bezierPath.CGPath;
//    [self fillColorWithPath:self.bezierPath.CGPath];
    [self setNeedsDisplay];
}

+ (CGPoint)midPointBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    return CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
}

+ (CGPoint)controlPointBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    CGPoint controlPoint = [self midPointBetweenPoint1:point1 andPoint2:point2];
    CGFloat diffY = abs((int) (point2.y - controlPoint.y));
    if (point1.y < point2.y)
        controlPoint.y += diffY;
    else if (point1.y > point2.y)
        controlPoint.y -= diffY;
    return controlPoint;
}


- (void)setChartData:(BarLineChartData *)chartData{
    _chartData = chartData;
}

#pragma mark ----- getter

- (CAGradientLayer *)lineGradientLayer{
    if (!_lineGradientLayer) {
        UIColor *color_2 = [UIColor colorWithRed:45/255.0 green:240/255.0 blue:219/255.0 alpha:1.0];
                   UIColor *color_1 = [UIColor colorWithRed:255/255.0 green:225/255.0 blue:50/255.0 alpha:1.0];
        _lineGradientLayer = [CAGradientLayer layer];
        _lineGradientLayer.colors = @[(__bridge id)color_1.CGColor,
        (__bridge id)color_2.CGColor];
        _lineGradientLayer.startPoint = CGPointMake(0, 0);
        _lineGradientLayer.endPoint = CGPointMake(0, 1);
        _lineGradientLayer.mask = self.chartLine;
        [self addSublayer:_lineGradientLayer];
    }
    return _lineGradientLayer;
}

- (CAShapeLayer *)chartLine{
    if (!_chartLine) {
        _chartLine = [CAShapeLayer layer];
//        _chartLine.backgroundColor = UIColor.grayColor.CGColor;
        _chartLine.lineCap = kCALineCapButt;
        _chartLine.lineJoin = kCALineJoinMiter;
        _chartLine.fillColor = [[UIColor clearColor] CGColor];
        _chartLine.strokeColor = UIColor.redColor.CGColor;
        _chartLine.lineWidth = 1;
        _chartLine.strokeEnd = 1.0;
        _chartLine.path = self.bezierPath.CGPath;
//        [self addSublayer:_chartLine];
    }
    return _chartLine;
}

- (UIBezierPath *)bezierPath{
    if (!_bezierPath) {
        _bezierPath = [UIBezierPath bezierPath];
    }
    return _bezierPath;
}

- (void)drawInContext:(CGContextRef)ctx{
    [super drawInContext:ctx];
    [self fillColorWithPath:self.bezierPath.CGPath InContext:ctx];
}

//颜色渐变
-(void)fillColorWithPath:(CGPathRef)pathRef InContext:(CGContextRef)ctx
{
    
    CGContextRef context = ctx;
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:51.0/255.0 green:153/255.0 blue:251/255.0 alpha:1.0].CGColor);
    CGContextSetLineWidth(context, 2.0);
    CGMutablePathRef startPath = CGPathCreateMutableCopy(pathRef);
    CGContextSetShouldAntialias(context, YES);
    
    CGPathCloseSubpath(startPath);    //封闭
    CGContextSaveGState(context);     //Save context for cliping
    
    CGContextAddPath(context, startPath);
    CGContextClip(context);
    CGPathRelease(startPath);
    // 创建色彩空间对象
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    // 创建起点颜色
    CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){16/255.0, 45/255.0, 136/255.0, 0.8});
    CGColorRef midColor = CGColorCreate(colorSpaceRef, (CGFloat[]){17/255.0, 104/255.0, 128/255.0, 0.5});
    // 创建终点颜色
    CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.0f, 0.0f, 0.0f, 0.0f});
    
    // 创建颜色数组
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor,midColor, endColor}, 3, nil);
    
    // 创建渐变对象
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,
        0.5,// 对应起点颜色位置
        1.0f// 对应终点颜色位置
    });
    
    // 释放颜色数组
    CFRelease(colorArray);
    
    // 释放起点和终点颜色
    CGColorRelease(beginColor);
    CGColorRelease(midColor);
    CGColorRelease(endColor);
    
    // 释放色彩空间
    CGColorSpaceRelease(colorSpaceRef);
    
    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0.0f, 0.0f), CGPointMake(0.0f, self.frame.size.height ), 0);
    
    // 释放渐变对象
    CGGradientRelease(gradientRef);
}

@end
