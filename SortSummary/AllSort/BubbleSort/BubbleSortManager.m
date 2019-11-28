//
//  BubbleSortManager.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//


#import "BubbleSortManager.h"


@implementation BubbleSortManager

+ (void)startBubbleSortWithDataArray:(NSArray *)array{
    
    NSMutableArray *mutableArray = [array mutableCopy];

    NSLog(@"排序前：%@",[mutableArray formatOutPut]);

    //交换次数
    NSInteger exchangeCount = 0;
    //比较次数
    NSInteger checkCount = 0;
    //标记有没有发生交换，如果没有发生则表示数组已经有序，退出排序
    BOOL haveChange = false;
    for (NSInteger i = 0; i < array.count; i++) {
        haveChange = false;
        for (NSInteger j = 0; j < array.count - 1 - i; j++) {

            NSLog(@"比较索引为%ld的值“%@”和索引为%ld的值“%@”",j,mutableArray[j],j+1,mutableArray[j+1]);
            if ([mutableArray[j] integerValue] > [mutableArray[j+1] integerValue]) {
                
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                
                NSLog(@"%@>%@成立，进行交换",mutableArray[j],mutableArray[j+1]);
                exchangeCount++;
    
                NSLog(@"排序中：%@\n",[mutableArray formatOutPut]);
                haveChange = true;
            }else{
                NSLog(@"%@>%@不成立，本次不交换\n",mutableArray[j],mutableArray[j+1]);
            }
            checkCount++;
            if (j == array.count - 2 - i) {
                if (haveChange) {
                    NSLog(@"----------本趟结束，最大的数值已放在数组最后-------\n");
                }else{
                    NSLog(@"----------***********本趟结束，且本趟没有进行交换，数组已经有序，退出排序***********-------\n\n");
                }
            }
        }
        if (haveChange == false) {
            break;
        }
    }

    NSLog(@"排序后：%@",[mutableArray formatOutPut]);
    
    NSLog(@"本次排序结束，一共比较%ld次，共进行%ld次交换",checkCount,exchangeCount);
}

@end
