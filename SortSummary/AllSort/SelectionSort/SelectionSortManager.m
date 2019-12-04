//
//  SelectionSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  选择排序

#import "SelectionSortManager.h"

@implementation SelectionSortManager

+ (void)startSelectionSortWithDataArray:(NSArray *)array block:(void(^)(NSString *))block{
    NSMutableArray *arr = [array mutableCopy];

//    HHLog(@"排序前：%@",[arr formatOutPut]);
    
    //比较次数
    NSInteger checkCount = 0;
    //交换次数
    NSInteger exchangeCount = 0;
    
    for (NSInteger i = 0 ; i < array.count; i++) {
        NSInteger minIndex = i;
        for (NSInteger j = i+1; j < array.count; j++) {
            checkCount++;
            if ([arr[j]integerValue] < [arr[minIndex]integerValue]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
            exchangeCount++;
        }
    }
    
    //HHLog(@"排序后：%@",[arr formatOutPut]);
    //HHLog(@"选择排序结束，一共比较%ld次，共进行%ld次交换",checkCount,exchangeCount);
    
    block([NSString stringWithFormat:@"选择排序结束:%@，共比较%ld次，共进行%ld次交换",[arr formatOutPut],checkCount,exchangeCount]);
}

@end
