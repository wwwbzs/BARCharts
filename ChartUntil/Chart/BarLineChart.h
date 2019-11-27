//
//  BarLineChart.h
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "BarLineChartData.h"
#import "BarLineChartDataItem.h"
#import "BarChartUntil.h"

NS_ASSUME_NONNULL_BEGIN

@class BarLineChart;

@protocol BarLineChartDataSource <NSObject>

@required
- (NSInteger)numberOfBarLineChart:(BarLineChart *)chart;

@end

@interface BarLineChart : CALayer

@property (nonatomic, strong) BarLineChartData *chartData;

/// 渐变色
@property(nullable, copy) NSArray *colors;

@property (nonatomic, weak) id<BarLineChartDataSource>dataSource;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, strong) BarChartUntil *until;

- (void)strokeChart;

@end

NS_ASSUME_NONNULL_END
