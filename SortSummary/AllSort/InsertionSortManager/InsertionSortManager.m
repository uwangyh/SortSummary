//
//  InsertionSortManager.m
//  SortSummary
//
//  Created by 彭西西 on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  插入排序

#import "InsertionSortManager.h"

@implementation InsertionSortManager

+ (void)startInsertionSortWithDataArray:(NSArray *)array{
    
    NSMutableArray *arr = [array mutableCopy];

    //NSLog(@"排序前：%@",[arr formatOutPut]);
    
    //比较次数
    int checkCount = 0;
    //交换次数
    int exchangeCount = 0;

    for (int i = 1; i < arr.count; i++) {
        for (int j = i; j > 0 ; j--) {
            
            checkCount++;
            //NSLog(@"比较索引为%ld的值“%@”和索引为%ld的值“%@”",j,mutableArray[j],j-1,mutableArray[j-1]);
            if ([arr[j] intValue] < [arr[j-1] intValue]) {
                
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j-1];

                //NSLog(@"%@>%@成立，进行交换",mutableArray[j],mutableArray[j-1]);
                exchangeCount++;

                //NSLog(@"排序中：%@\n",[mutableArray formatOutPut]);
            }else{
                NSLog(@"%@>%@不成立，本次不交换，本趟排序结束\n",arr[j],arr[j-1]);
                break;
            }
        }
    }
    
    //NSLog(@"排序后：%@",[arr formatOutPut]);
    NSLog(@"插入排序结束，一共比较%d次，共进行%d次交换",checkCount,exchangeCount);
    
}

@end
