//
//  BarChartUntil.h
//  ChartUntil
//
//  Created by 白志帅 on 2019/11/27.
//  Copyright © 2019 barray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BarChartUntil : NSObject

@property (nonatomic) CGFloat minValue;
@property (nonatomic) CGFloat maxValue;
@property (nonatomic,readonly) CGFloat currentValue;
@property (nonatomic) CGFloat minCoord;
@property (nonatomic) CGFloat maxCoord;
@property (nonatomic,readonly) CGFloat currentCoord;
@property (nonatomic, assign) CGFloat scale;



+ (instancetype)shareChartUntil;

- (CGFloat)valueForCoordinate:(CGFloat)coord;
- (CGFloat)coordinateForValue:(CGFloat)value;

- (void)updataCoordForValue:(CGFloat)value;

- (void)updataCoordForValue:(CGFloat)value scale:(CGFloat)scale;
- (void)updataCoordDelet:(CGFloat)delet;

@end

NS_ASSUME_NONNULL_END
