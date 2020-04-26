//
//  BubbleSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  冒泡排序


#import "BubbleSortManager.h"


@implementation BubbleSortManager

+ (void)startBubbleSortWithDataArray:(NSArray *)array block:(void(^)(NSString *))block{
    
    NSMutableArray *arr = [array mutableCopy];
    HHLog(@"冒泡排序开始");
    HHLog(@"排序前：%@",[arr formatOutPut]);
    
    NSDate *startTime = [NSDate date];

    //交换次数
    NSInteger exchangeCount = 0;
    //比较次数
    NSInteger checkCount = 0;
    //标记有没有发生交换，如果没有发生则表示数组已经有序，退出排序
    BOOL haveChange = false;
    for (NSInteger i = 0; i < arr.count; i++) {
        haveChange = false;
        for (NSInteger j = 0; j < array.count - 1 - i; j++) {

            //HHLog(@"比较索引为%ld的值“%@”和索引为%ld的值“%@”",j,mutableArray[j],j+1,mutableArray[j+1]);
            if ([arr[j] integerValue] > [arr[j+1] integerValue]) {
                
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                
                HHLog(@"%@>%@成立，进行交换",mutableArray[j],mutableArray[j+1]);
                exchangeCount++;
    
                HHLog(@"排序中：%@\n",[mutableArray formatOutPut]);
                haveChange = true;
            }else{
                HHLog(@"%@>%@不成立，本次不交换\n",mutableArray[j],mutableArray[j+1]);
            }
            checkCount++;
            if (j == array.count - 2 - i) {
                if (haveChange) {
                    HHLog(@"----------本趟结束，最大的数值已放在数组最后-------\n");
                }else{
                    HHLog(@"----------***********本趟结束，且本趟没有进行交换，数组已经有序，退出排序***********-------\n\n");
                }
            }
        }
        if (haveChange == false) {
            break;
        }
    }

    //HHLog(@"排序后：%@",[arr formatOutPut]);
    //HHLog(@"冒泡排序结束，一共比较%ld次，共进行%ld次交换",checkCount,exchangeCount);
    //block([NSString stringWithFormat:@"冒泡排序结束:%@，共比较%ld次，共进行%ld次交换",[arr formatOutPut],checkCount,exchangeCount]);
    block([NSString stringWithFormat:@"冒泡排序结束，总计%ld个元素，耗时%f，共比较%ld次，共进行%ld次交换",arr.count,-[startTime timeIntervalSinceNow],checkCount,exchangeCount]);
}

@end
