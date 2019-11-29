//
//  QucikSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/29.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import "QucikSortManager.h"

@implementation QucikSortManager

/*
 1.挑选基准值：从数列中挑出一个元素，称为“基准”（pivot）；
 2.分割：重新排序数列，所有比基准值小的元素摆放在基准前面，所有比基准值大的元素摆在基准后面（与基准值相等的数可以到任何一边）。在这个分割结束之后，对基准值的排序就已经完成；
 3.递归排序子序列：递归地将小于基准值元素的子序列和大于基准值元素的子序列排序。
 */

+ (void)startQucikSortWithDataArray:(NSArray *)array{
    NSMutableArray *arr = [array mutableCopy];

    //NSLog(@"排序前：%@",[arr formatOutPut]);
    
    //比较次数
    NSInteger checkCount = 0;
    //交换次数
    NSInteger exchangeCount = 0;
    
    
    
    
}

+ (void)qucickSort:(NSMutableArray *)m low:(int)low high:(int)high{

    NSLog(@"原数组：%@",[m formatOutPut]);
    
    if (low >= high) {
        NSLog(@"排序结束%@",[m formatOutPut]);
        return;
    }
    int i = low;
    int j = high;
    id key = m[i];

    NSLog(@"i--%d,j--%d,key--%d",i,j,[key intValue]);
    
    while (i < j) {
        while (i < j && [m[j] intValue] >= [key intValue]) {
            j--;
        }
        if (i == j) {
            //当key时目前最小值时，会出现i=j的情况
            break;
        }
        m[i++] = m[j]; // i++会减少一次m[i]和key的比较
        NSLog(@"发生改变%@",[m formatOutPut]);
        
        while (i < j && [m[i] intValue] <= [key intValue]) {
            i++;
        }
        if (i == j) {
            //当key时目前最大的数时(m[j]的前面)，会出现i=j的情况
            break;
        }
        m[j--] = m[i];
        NSLog(@"发生改变%@",[m formatOutPut]);
    }
    m[i] = key;
    [self qucickSort:m low:low high:i-1];
    [self qucickSort:m low:i+1 high:high];
}

@end
