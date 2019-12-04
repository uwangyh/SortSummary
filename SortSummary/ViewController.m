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
    NSArray *sourceArr = @[@9,@3,@5,@10,@1,@6,@4,@2,@7,@8];
    //NSArray *sourceArr = @[@7,@6,@5];
    //NSArray *sourceArr = @[@6,@2,@3,@4,@5];
    
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
    [[QuickSortManager shareInstance]startQucikSortWithDataArray:sourceArr pivotIndex:LeftEle block:^(NSString *sortReslut) {
        NSLog(@"%@",sortReslut);
    }];
    
}


@end
