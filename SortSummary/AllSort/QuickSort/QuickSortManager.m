//
//  QuickSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/29.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  快速排序

#import "QuickSortManager.h"

@interface QuickSortManager()

@property(nonatomic,assign)NSInteger checkCount;
@property(nonatomic,assign)NSInteger exchangeCount;
@property(nonatomic,strong)NSDate *startTime;

@end

@implementation QuickSortManager

static QuickSortManager *manager = nil;

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self.class alloc]init];
    });
    return manager;
}

/*
 1.挑选基准值：从数列中挑出一个元素，称为“基准”（pivot）；
 2.分割：重新排序数列，所有比基准值小的元素摆放在基准前面，所有比基准值大的元素摆在基准后面（与基准值相等的数可以到任何一边）。在这个分割结束之后，对基准值的排序就已经完成；
 3.递归排序子序列：递归地将小于基准值元素的子序列和大于基准值元素的子序列排序。
 */

- (void)startQucikSortWithDataArray:(NSArray *)array pivotIndex:(PivotIndex)index block:(void(^)(NSString *))block{
    NSMutableArray *arr = [array mutableCopy];
    self.startTime = [NSDate date];
    [self sort:arr left:0 right:arr.count-1 pivotIndex:index block:block];
}

- (void)sort:(NSMutableArray *)arr left:(int)left right:(int)right pivotIndex:(PivotIndex)index block:(void(^)(NSString *))block{

    HHLog(@"原来数组：%@",[arr formatOutPut]);
    
    if (left >= right) {
        HHLog(@"排序结束：%@---left:%d---right:%d",[arr formatOutPut],left,right);
        if (right == arr.count-1) {
            //HHLog(@"排序结果:%@,本次排序共进行%ld次比较，%ld次交换",[arr formatOutPut],self.checkCount,self.exchangeCount);
            NSString *pivotDesc;
            if (index == LeftEle) {
                pivotDesc = @"第一个元素";
            }else if (index == RightEle){
                pivotDesc = @"最后一个元素";
            }else{
                pivotDesc = @"中间元素";
            }
            
            block([NSString stringWithFormat:
                   @"快速排序结束，总计%ld个元素，耗时%f，共比较%ld次，共进行%ld次交换，本次排序基准值选取%@，",
                   arr.count,
                   -[self.startTime timeIntervalSinceNow],
                   self.checkCount,
                   self.exchangeCount,
                   pivotDesc]);
            
            //block([NSString stringWithFormat:@"快速排序结束:%@，共比较%ld次，共进行%ld次交换，本次排序基准值选取%@，",[arr formatOutPut],self.checkCount,self.exchangeCount,pivotDesc]);
        }
        return;
    }
    int i = left;   //左边哨兵
    int j = right;  //右边哨兵
    int pivotIndex; //基准值索引
    if (index == LeftEle) {
        pivotIndex = left;
    }else if (index == RightEle){
        pivotIndex = right;
    }else{
        pivotIndex = (left+right)/2+1;
    }
    
    int pivot = [arr[pivotIndex]intValue]; //取左边第一个元素为基准值
    HHLog(@"本次排序基准值索引%d--值%d，排序范围%d~%d",pivotIndex,pivot,left,right);
    BOOL isLeftMoved = false;
    //开始遍历 从右边的哨兵j开始
    for (; j > i; j--) {
        if (j == pivotIndex) {
            continue;
        }
        //右边的哨兵先找到第一个<=基准值的元素 就停在这个位置，让左边的哨兵开始行动
        self.checkCount++;
        if ([arr[j]intValue] <= pivot) {
            isLeftMoved = true;
            for (; i <= j; i++) {
                if (i == pivotIndex) {
                    continue;
                }
                //左边的哨兵找到了从第i个元素开始往后的第一个>基准值的元素，此时进行交换,
                if (i == j) {
                    //此时左右哨兵相遇 退出循环
                    break;
                }

                self.checkCount++;
                if ([arr[i]intValue] > pivot) {
                    //进行交换
                    [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
                    self.exchangeCount++;
                    //HHLog(@"发生改变：%@",[arr formatOutPut]);
                    //交换完毕 继续让右边的哨兵开始行动
                    break;
                }
            }
        }
        if (i == j) {
            HHLog(@"哨兵在索引--%d，值--%d处相遇",i,[arr[i]intValue]);
            //此时左右哨兵相遇 退出循环
            break;
        }
    }
    //本轮排序结束 将基准值和i和j相遇所在的元素进行交换 此时i=j;
    if (pivotIndex <= i) {
        //基准值在i左侧 此时需要左边数组的最后一个元素对比基准值进行交换
        //eg:数组3，1，2，5，6，4 以3位基准，哨兵在在元素2，那么数组分割成“1，2”和“5，6，4”；基准在左侧，则需要“3”和“2”进行对比交换
        if (pivot > [arr[i]intValue]) {
            self.exchangeCount++;
            [arr exchangeObjectAtIndex:pivotIndex withObjectAtIndex:i];
        }
    }else{
        //基准值在i右边侧 此时需要右边数组的第一个元素对比基准值交换
        //eg:数组2，1，3，5，6，4 以4位基准，哨兵相遇在元素3，那么数组分割成 “2，1，3”和“5，6”；基准在右侧，则需要“4”和“5”进行对比交换(基准和i+1)
        if (isLeftMoved) {
            i++;
        }
        //如果左侧哨兵没有行动过，则表示参加排序的元素全部>基准值； eg: 数组6,7,2  以基准值为2进行排序，此时左边哨兵没有行动的机会,便可直接和i(0)交换索引值
        if (pivot < [arr[i]intValue]) {
            self.exchangeCount++;
            [arr exchangeObjectAtIndex:pivotIndex withObjectAtIndex:i];
        }
    }

    //此时基准值前面的元素已经满足<=基准值   后面的元素已经满足>基准值
    HHLog(@"本趟结束：%@",[arr formatOutPut]);
    
    //将前后两个数字递归排序
    //前半部
    HHLog(@"开始前半部排序");
    [self sort:arr left:left right:i-1 pivotIndex:index block:block];
    //后半部
    HHLog(@"开始后半部排序");
    [self sort:arr left:i+1 right:right pivotIndex:index block:block];
}

/*
+ (void)qucickSort:(NSMutableArray *)m low:(int)low high:(int)high{

    //HHLog(@"原数组：%@",[m formatOutPut]);
    
    if (low >= high) {
        HHLog(@"排序结束%@---left:%d---right:%d",[m formatOutPut],low,high);
        return;
    }
    int i = low;
    int j = high;
    id key = m[i];

    //HHLog(@"low--%d,high--%d,key--%d",i,j,[key intValue]);
    
    while (i < j) {
        while (i < j && [m[j] intValue] >= [key intValue]) {
            j--;
        }
        if (i == j) {
            //当key时目前最小值时，会出现i=j的情况
            break;
        }
        m[i++] = m[j]; // i++会减少一次m[i]和key的比较
        //HHLog(@"发生改变%@",[m formatOutPut]);
        
        while (i < j && [m[i] intValue] <= [key intValue]) {
            i++;
        }
        if (i == j) {
            //当key时目前最大的数时(m[j]的前面)，会出现i=j的情况
            break;
        }
        m[j--] = m[i];
        //HHLog(@"发生改变%@",[m formatOutPut]);
    }
    m[i] = key;
    [self qucickSort:m low:low high:i-1];
    [self qucickSort:m low:i+1 high:high];
}*/

@end
