//
//  ViewController.m
//  ChartUntil
//
//  Created by barray on 2019/11/25.
//  Copyright © 2019 barray. All rights reserved.
//

#import "ViewController.h"
#import "BarGridLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BarGridLayer *layer = [BarGridLayer layer];
    layer.frame = CGRectMake(100, 100, 200, 200);
    [self.view.layer addSublayer:layer];
    layer.backgroundColor = UIColor.redColor.CGColor;
//    layer.horizontalCount = 5;
//    layer.verticalCount = 5;
//    layer.gridWidth = 1;
//    layer.gridColor = UIColor.greenColor.CGColor;
    [layer strokeGrid];
    // Do any additional setup after loading the view.
}


@end
