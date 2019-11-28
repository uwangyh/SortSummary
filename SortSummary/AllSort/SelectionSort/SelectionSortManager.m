//
//  SelectionSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  选择排序

#import "SelectionSortManager.h"

@implementation SelectionSortManager

+ (void)startSelectionSortWithDataArray:(NSArray *)array{
    NSMutableArray *mutableArray = [array mutableCopy];

     NSLog(@"排序前：%@",[mutableArray formatOutPut]);
    
    //比较次数
    NSInteger checkCount = 0;
    //交换次数
    NSInteger exchangeCount = 0;
    
    for (NSInteger i = 0 ; i < array.count; i++) {
        NSInteger minIndex = i;
        for (NSInteger j = i+1; j < array.count; j++) {
            checkCount++;
            if ([mutableArray[j]integerValue] < [mutableArray[minIndex]integerValue]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
            exchangeCount++;
        }
    }
    
    NSLog(@"排序后：%@",[mutableArray formatOutPut]);
    
    NSLog(@"本次排序结束，一共比较%ld次，共进行%ld次交换",checkCount,exchangeCount);
    
}

@end
