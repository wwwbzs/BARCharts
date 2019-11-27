//
//  BarChartUntil.m
//  ChartUntil
//
//  Created by 白志帅 on 2019/11/27.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarChartUntil.h"

@interface BarChartUntil ()

@property (nonatomic, readwrite) CGFloat currentValue;
@property (nonatomic, readwrite) CGFloat currentCoord;

@property (nonatomic) CGFloat currentMinCoord;
@property (nonatomic) CGFloat currentMaxCoord;

@end

@implementation BarChartUntil

+ (instancetype)shareChartUntil{
    static BarChartUntil *until = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        until = [[BarChartUntil alloc] init];
    });
    return until;
}

- (CGFloat)coordinateForValue:(CGFloat)value{
    CGFloat scale = (value - self.minValue)/(self.maxValue - self.minValue);
    return self.currentMinCoord + (self.currentMaxCoord - self.currentMinCoord)*scale;
}

- (CGFloat)valueForCoordinate:(CGFloat)coord{
    CGFloat scale = (coord - self.currentMinCoord)/(self.currentMaxCoord - self.currentMinCoord);
    return self.minValue + (self.maxValue - self.minValue)*scale;
}

- (void)updataCoordForValue:(CGFloat)value{
    self.currentCoord = value;
    self.currentValue = [self valueForCoordinate:value];
}

- (void)updataCoordForValue:(CGFloat)value scale:(CGFloat)scale{
    [self updataCoordForValue:value];
    CGFloat width = (self.maxValue - self.minValue);
    CGFloat scaleWidth = width*scale;
    self.currentMaxCoord = self.currentCoord + (self.maxValue - self.currentValue)/width*scaleWidth;
    self.currentMinCoord = self.currentCoord - (self.currentCoord - self.minCoord)/width*scaleWidth;
//    self.minValue = [self valueForCoordinate:self.minCoord];
//    self.maxValue = [self valueForCoordinate:self.maxCoord];
    self.scale = scale;
}

- (void)updataCoordDelet:(CGFloat)delet{
    NSLog(@")))))))))))%f",delet);
    self.currentMaxCoord = self.currentMaxCoord + delet;
    self.currentMinCoord = self.currentMinCoord + delet;
}

- (void)setMaxCoord:(CGFloat)maxCoord{
    self.currentMaxCoord = maxCoord;
    _maxCoord = maxCoord;
}

- (void)setMinCoord:(CGFloat)minCoord{
    self.currentMinCoord = minCoord;
    _minCoord = minCoord;
}

@end
