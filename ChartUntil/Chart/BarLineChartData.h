//
//  BarLineChartData.h
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BARLineChartPointStyle) {
    BARLineChartPointStyleNone = 0,
    BARLineChartPointStyleCircle = 1,
    BARLineChartPointStyleSquare = 3,
    BARLineChartPointStyleTriangle = 4
};


@class BarLineChartDataItem;

typedef BarLineChartDataItem *_Nonnull(^BarLineChartDataGetter)(NSUInteger index);

NS_ASSUME_NONNULL_BEGIN





@interface BarLineChartData : NSObject

@property (strong) UIColor *color;
@property (nonatomic) CGFloat alpha;
@property NSUInteger itemCount;
@property (copy) BarLineChartDataGetter getData;
@property (strong, nonatomic) NSString *dataTitle;

@property (nonatomic) BOOL showPointLabel;
@property (nonatomic) UIColor *pointLabelColor;
@property (nonatomic) UIFont *pointLabelFont;
@property (nonatomic) NSString *pointLabelFormat;

@property (nonatomic, assign) BARLineChartPointStyle inflexionPointStyle;
@property (nonatomic) UIColor *inflexionPointColor;

/**
 * If PNLineChartPointStyle is circle, this returns the circle's diameter.
 * If PNLineChartPointStyle is square, each point is a square with each side equal in length to this value.
 */
@property (nonatomic, assign) CGFloat inflexionPointWidth;

@property (nonatomic, assign) CGFloat lineWidth;

@end

NS_ASSUME_NONNULL_END
