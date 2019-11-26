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
#import "BarLineChartView.h"

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
    lineChart.frame = CGRectMake(0, 0, 200, 200);
    lineChart.dataSource = self;
    BarLineChartData *data = [[BarLineChartData alloc] init];
    NSArray *dataArray1 = @[@10,@20,@30,@40,@50,@60,@70,@80,@90,@100];
    NSArray *dataArray2 = @[@100,@28,@60,@70,@110,@20,@40,@31,@90,@100];
    data.getData = ^BarLineChartDataItem * _Nonnull(NSUInteger index) {
        return [BarLineChartDataItem dataIteminX:[dataArray1[index] floatValue] WithY:[dataArray2[index] floatValue]];
    };
    lineChart.chartData = data;
//    lineChart.backgroundColor = UIColor.blueColor.CGColor;
    [layer strokeGrid];
    [lineChart strokeChart];
    [layer addSublayer:lineChart];
    
    
    BarLineChartView *lineView = [[BarLineChartView alloc] initWithFrame:CGRectMake(200, 400, 200, 220)];
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < dataArray1.count; i++) {
        [array addObject:[BarLineChartDataItem dataIteminX:[dataArray1[i] floatValue] WithY:[dataArray2[i] floatValue]]];
    }
    lineView.dataSource = array;
    lineView.bottom = 20;
    [self.view addSubview:lineView];
    [lineView strokedLayer];
    
//    layer.horizontalCount = 5;
//    layer.verticalCount = 5;
//    layer.gridWidth = 1;
//    layer.gridColor = UIColor.greenColor.CGColor;
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfBarLineChart:(BarLineChart *)chart{
    return 10;
}


@end
