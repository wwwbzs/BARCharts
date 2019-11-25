//
//  BarGridLayer.h
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface BarGridLayer : CALayer

@property (nonatomic, assign) NSInteger horizontalCount;
@property (nonatomic, assign) NSInteger verticalCount;
@property (nonatomic, assign) CGFloat gridWidth;

@property (nonatomic, assign) CGColorRef  _Nonnull gridColor;
- (void)strokeGrid;
@end

NS_ASSUME_NONNULL_END
