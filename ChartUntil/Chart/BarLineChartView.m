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
#import <Masonry/Masonry.h>

@interface BarLineChartView ()<BarLineChartDataSource>

@property (nonatomic, strong) BarLineChart *lineChart;
@property (nonatomic, strong) BarGridLayer *gridLayer;

@property (nonatomic, strong) NSMutableArray *xLabels;

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
    self.lineChart = [BarLineChart layer];
    self.lineChart.dataSource = self;
    __weak BarLineChartView *weakSelf = self;
    self.lineChart.chartData = [[BarLineChartData alloc] init];
    self.lineChart.chartData.getData = ^BarLineChartDataItem * _Nonnull(NSUInteger index) {
        return weakSelf.dataSource[index];
    };
    self.gridLayer = [BarGridLayer layer];
    CGFloat width = self.bounds.size.width - _left - _right;
    CGFloat height = self.bounds.size.height - _top - _bottom;
    self.gridLayer.frame = CGRectMake(_top, _left, width, height);
    self.gridLayer.lineChart = self.lineChart;
    [self.gridLayer strokeGrid];
    NSArray * familyNames = [UIFont familyNames];
       for(NSString *  familyName in familyNames)
       {
           NSLog(@"%@", familyName);
           NSArray  * fontNames = [UIFont fontNamesForFamilyName:familyName];
           for(NSString * fontName in fontNames)
           {
               //  NSLog(@"\t%@", fontName);
               printf("%s\n",[fontName UTF8String]);
           }
       }
    [self.layer addSublayer:self.gridLayer];
    [self addXLabels];
}


- (void)addXLabels{
    [self.xLabels removeAllObjects];
    CGFloat xStepWidth = self.gridLayer.frame.size.width / self.gridLayer.verticalCount;
    for (int i = 0; i < self.gridLayer.verticalCount+1; i++) {
        UILabel *lb = [UILabel new];
        [self.xLabels addObject:lb];
        lb.text = @"32";
        lb.textColor = self.xColor;
        [self addSubview:lb];
        lb.font = [UIFont systemFontOfSize:10];
        [lb sizeToFit];
        if (i == 0) {
//            lb.frame = CGRectMake(_left, self.frame.size.height - 10, 0, 0);
            lb.textAlignment = NSTextAlignmentLeft;
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(_left));
                make.bottom.equalTo(self);
            }];
        } else if (i == self.gridLayer.horizontalCount){
            lb.textAlignment = NSTextAlignmentRight;
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(_right));
                make.bottom.equalTo(self);
            }];
        } else {
            CGFloat x = i * xStepWidth + _left - self.frame.size.width/2;
            lb.textAlignment = NSTextAlignmentCenter;
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.mas_centerX).offset(x);
                make.bottom.equalTo(self);
            }];
        }
        
    }
    
}

- (NSInteger)numberOfBarLineChart:(BarLineChart *)chart{
    return self.dataSource.count;
}

- (NSMutableArray *)xLabels{
    if (!_xLabels) {
        _xLabels = [NSMutableArray new];
    }
    return _xLabels;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
