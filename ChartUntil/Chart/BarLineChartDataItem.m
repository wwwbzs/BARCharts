//
//  BarLineChartDataItem.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "BarLineChartDataItem.h"


@interface BarLineChartDataItem ()

- (id)initWithX:(CGFloat)x WithY:(CGFloat)y;

@property (readwrite) CGFloat y;    // should be within the y range
@property (readwrite) CGFloat rawY; // this is the raw value, used for point label.
@property (readwrite) CGFloat x;
@property (readwrite) CGPoint point;

@end

@implementation BarLineChartDataItem

+ (BarLineChartDataItem *)dataIteminX:(CGFloat)x WithY:(CGFloat)y
{
    return [[BarLineChartDataItem alloc] initWithX:x WithY:y];
}

//+ (BarLineChartDataItem *)dataItemWithY:(CGFloat)y andRawY:(CGFloat)rawY {
//    return [[BarLineChartDataItem alloc] initWithY:y andRawY:rawY];
//}


- (id)initWithX:(CGFloat)x WithY:(CGFloat)y
{
    self = [super init];
    if (self) {
        self.y = y;
        self.x = x;
        self.point = CGPointMake(x, y);
    }

    return self;
}

@end
