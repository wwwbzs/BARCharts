//
//  BarLineChart.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarLineChart.h"

@interface BarLineChart ()

//@property (nonatomic, strong) NSMutableArray *chartPath;
@property (nonatomic, strong) CAShapeLayer *chartLine;
@property (nonatomic, strong) CAGradientLayer *lineGradientLayer;

@end

@implementation BarLineChart

- (void)strokeChart{
    
}

- (void)setChartData:(NSData *)chartData{
    [self.chartLine removeFromSuperlayer];
    
}

@end
