//
//  ViewController.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "ViewController.h"
#import "BarGridLayer.h"
#import "BarLineChart.h"

@interface ViewController ()<BarLineChartDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BarGridLayer *layer = [BarGridLayer layer];
    layer.frame = CGRectMake(100, 100, 200, 200);
    [self.view.layer addSublayer:layer];
    layer.backgroundColor = UIColor.redColor.CGColor;
    BarLineChart *lineChart = [BarLineChart layer];
    lineChart.frame = CGRectMake(100, 400, 200, 200);
    lineChart.dataSource = self;
    BarLineChartData *data = [[BarLineChartData alloc] init];
    NSArray *dataArray1 = @[@10,@20,@30,@40,@50,@60,@70,@80,@90,@100];
    NSArray *dataArray2 = @[@10,@28,@60,@70,@90,@20,@40,@31,@90,@100];
    data.getData = ^BarLineChartDataItem * _Nonnull(NSUInteger index) {
        return [BarLineChartDataItem dataIteminX:[dataArray1[index] floatValue] WithY:[dataArray2[index] floatValue]];
    };
    lineChart.chartData = data;
//    lineChart.backgroundColor = UIColor.blueColor.CGColor;
    [lineChart strokeChart];
    [self.view.layer addSublayer:lineChart];
    
    
//    layer.horizontalCount = 5;
//    layer.verticalCount = 5;
//    layer.gridWidth = 1;
//    layer.gridColor = UIColor.greenColor.CGColor;
    [layer strokeGrid];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfBarLineChart:(BarLineChart *)chart{
    return 10;
}


@end
