//
//  BarGridLayer.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarGridLayer.h"
#import <UIKit/UIKit.h>

@interface BarGridLayer()

@property (nonatomic, strong) NSMutableArray *xLayers;
@property (nonatomic, strong) NSMutableArray *yLayers;

@end

@implementation BarGridLayer


- (instancetype)init{
    if (self = [super init]) {
        [self defalutConfi];
    }
    return self;
}

- (void)defalutConfi{
    self.gridColor = UIColor.blackColor.CGColor;
    self.gridWidth = 0.5;
    self.horizontalCount = self.verticalCount = 5;
//    [self strokeGrid];
}

- (void)strokeGrid{
    for (CALayer *layer in self.xLayers) {
        [layer removeFromSuperlayer];
    }
    for (CALayer *layer in self.yLayers) {
        [layer removeFromSuperlayer];
    }
    self.xLayers = [NSMutableArray arrayWithCapacity:self.horizontalCount];
    self.yLayers = [NSMutableArray arrayWithCapacity:self.verticalCount];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat yStepHeight = (height - (self.horizontalCount + 1) * self.gridWidth) / self.horizontalCount;
    CGFloat xStepWidth = (width - (self.verticalCount +1)*self.gridWidth) / self.verticalCount;
    for (int i = 0; i < self.horizontalCount+1; i++) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, i * (yStepHeight + self.gridWidth), width, self.gridWidth);
        layer.backgroundColor = self.gridColor;
        [self addSublayer:layer];
        [self.xLayers addObject:layer];
    }
    
    for (int i = 0; i < self.verticalCount+1; i++) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(i * (xStepWidth+self.gridWidth), 0, self.gridWidth, height);
        layer.backgroundColor = self.gridColor;
        [self addSublayer:layer];
        [self.yLayers addObject:layer];
    }
    self.masksToBounds = YES;
    self.lineChart.frame = self.bounds;
    [self.lineChart strokeChart];
    [self addSublayer:self.lineChart];
}

@end
