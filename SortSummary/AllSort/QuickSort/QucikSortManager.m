//
//  QucikSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/29.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  快速排序

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

+ (void)sort:(NSMutableArray *)arr left:(int)left right:(int)right{
    //NSMutableArray *arr = [array mutableCopy];
    
    NSLog(@"原来数组：%@",[arr formatOutPut]);
    
    if (left > right) {
        NSLog(@"排序结束%@---left:%d---right:%d",[arr formatOutPut],left,right);
        return;
    }
    int i = left;   //左边哨兵
    int j = right;  //右边哨兵
    int pivotIndex = right; //基准值索引
    int pivot = [arr[pivotIndex]intValue]; //取左边第一个元素为基准值
    
    //开始遍历 从右边的哨兵j开始
    for (; j > i; j--) {
        if (j == pivotIndex) {
            continue;
        }
        //右边的哨兵先找到第一个<=基准值的元素 就停在这个位置，让左边的哨兵开始行动
        if ([arr[j]intValue] <= pivot) {
            for (; i <= j; i++) {
                if (i == pivotIndex) {
                    continue;
                }
                //左边的哨兵找到了从第i个元素开始往后的第一个>基准值的元素，此时进行交换,
                if (i == j) {
                    //此时左右哨兵相遇 退出循环
                    break;
                }
                
                if ([arr[i]intValue] > pivot) {
                    //进行交换
                    [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
                    NSLog(@"发生改变：%@",[arr formatOutPut]);
                    //交换完毕 继续让右边的哨兵开始行动
                    break;
                }
            }
        }
        if (i == j) {
            NSLog(@"哨兵在索引--%d，值--%d出相遇",i,[arr[i]intValue]);
            //此时左右哨兵相遇 退出循环
            break;
        }
    }
    //本轮排序结束 将基准值和i和j相遇所在的元素进行交换 此时i=j;
    if (pivotIndex <= i) {
        //基准值在i左侧 根据值大小确定需要交换
        if (pivot > [arr[i]intValue]) {
            [arr exchangeObjectAtIndex:pivotIndex withObjectAtIndex:i];
        }
    }else{
        //基准值在i右边侧
        if (pivot < [arr[i]intValue]) {
            [arr exchangeObjectAtIndex:pivotIndex withObjectAtIndex:i];
        }
    }
    

    //此时基准值前面的元素已经满足<=基准值   后面的元素已经满足>基准值
    NSLog(@"本趟结束：%@",[arr formatOutPut]);
    
    //将前后两个数字递归排序
    
    //前半部
    [self sort:arr left:left right:i-1];
    //后半部
    [self sort:arr left:i+1 right:right];
    
}

+ (void)qucickSort:(NSMutableArray *)m low:(int)low high:(int)high{

    //NSLog(@"原数组：%@",[m formatOutPut]);
    
    if (low >= high) {
        NSLog(@"排序结束%@---left:%d---right:%d",[m formatOutPut],low,high);
        return;
    }
    int i = low;
    int j = high;
    id key = m[i];

    //NSLog(@"low--%d,high--%d,key--%d",i,j,[key intValue]);
    
    while (i < j) {
        while (i < j && [m[j] intValue] >= [key intValue]) {
            j--;
        }
        if (i == j) {
            //当key时目前最小值时，会出现i=j的情况
            break;
        }
        m[i++] = m[j]; // i++会减少一次m[i]和key的比较
        //NSLog(@"发生改变%@",[m formatOutPut]);
        
        while (i < j && [m[i] intValue] <= [key intValue]) {
            i++;
        }
        if (i == j) {
            //当key时目前最大的数时(m[j]的前面)，会出现i=j的情况
            break;
        }
        m[j--] = m[i];
        //NSLog(@"发生改变%@",[m formatOutPut]);
    }
    m[i] = key;
    [self qucickSort:m low:low high:i-1];
    [self qucickSort:m low:i+1 high:high];
}

@end
