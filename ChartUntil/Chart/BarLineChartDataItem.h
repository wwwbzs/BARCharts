//
//  BarLineChartDataItem.h
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface BarLineChartDataItem : NSObject

+ (BarLineChartDataItem *)dataIteminX:(CGFloat)x WithY:(CGFloat)y;
//+ (BarLineChartDataItem *)dataItemWithY:(CGFloat)y andRawY:(CGFloat)rawY;

@property (nonatomic,readonly) CGFloat y; // should be within the y range
@property (nonatomic,readonly) CGFloat x;
@property (nonatomic,readonly) CGPoint point;

//@property (readonly) CGFloat rawY; // this is the raw value, used for point label.

@end

NS_ASSUME_NONNULL_END
