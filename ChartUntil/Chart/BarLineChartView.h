//
//  BarLineChartView.h
//  ChartUntil
//
//  Created by 白志帅 on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarLineChart.h"

NS_ASSUME_NONNULL_BEGIN

@interface BarLineChartView : UIView

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, copy) NSArray <BarLineChartDataItem*>*dataSource;

- (void)strokedLayer;

@end

NS_ASSUME_NONNULL_END
