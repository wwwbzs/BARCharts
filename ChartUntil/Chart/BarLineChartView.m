//
//  BarLineChartView.m
//  ChartUntil
//
//  Created by 白志帅 on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarLineChartView.h"
#import "BarLineChart.h"
#import "BarGridLayer.h"

@interface BarLineChartView ()

@property (nonatomic, strong) BarLineChart *lineChart;
@property (nonatomic, strong) BarGridLayer *gridLayer;

@end

@implementation BarLineChartView

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self defauiltConfi];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self defauiltConfi];
    }
    return self;
}

- (void)defauiltConfi{
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scrollLineChart:)];
    [self addGestureRecognizer:panGes];
    UIPinchGestureRecognizer *pinGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleLineChart:)];
    [self addGestureRecognizer:pinGes];
}

- (void)scrollLineChart:(UIPanGestureRecognizer *)panGes{
}

- (void)scaleLineChart:(UIPinchGestureRecognizer *)pinGes{
}

#pragma mark --- stroked

- (void)strokedLayer{
    [self.lineChart strokeChart];
    [self.gridLayer strokeGrid];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
