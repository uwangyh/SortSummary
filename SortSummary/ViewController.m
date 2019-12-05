//
//  ViewController.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSArray *sourceArr = @[@8,@3,@5,@10,@1,@6,@4,@2,@7,@9];
    
    //随机生成数据源
    NSArray *sourceArr = [self getRandomSourceCount:500000];
    NSLog(@"本次排序共个%ld元素",sourceArr.count);

    //冒泡排序
    [BubbleSortManager startBubbleSortWithDataArray:sourceArr block:^(NSString *sortReslut) {
        NSLog(@"%@",sortReslut);
    }];
    
    //选择排序
    [SelectionSortManager startSelectionSortWithDataArray:sourceArr block:^(NSString *sortReslut) {
        NSLog(@"%@",sortReslut);
    }];
    
    //插入排序
    [InsertionSortManager startInsertionSortWithDataArray:sourceArr block:^(NSString *sortReslut) {
        NSLog(@"%@",sortReslut);
    }];
    
    //快速排序
    [[QuickSortManager shareInstance]startQucikSortWithDataArray:sourceArr pivotIndex:MiddleEle block:^(NSString *sortReslut) {
        NSLog(@"%@",sortReslut);
    }];
    
}


- (NSArray *)getRandomSourceCount:(int)count{
    NSMutableArray *soucrArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < count; i++) {
        int num = arc4random_uniform(10000000);
        [soucrArr addObject:[NSNumber numberWithInt:num]];
    }
    return soucrArr;
}

@end
