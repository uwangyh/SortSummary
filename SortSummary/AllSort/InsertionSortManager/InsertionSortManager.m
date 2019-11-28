//
//  InsertionSortManager.m
//  SortSummary
//
//  Created by 彭西西 on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//  插入排序

#import "InsertionSortManager.h"

@implementation InsertionSortManager

+ (void)startSelectionSortWithDataArray:(NSArray *)array{
    
    NSMutableArray *mutableArray = [array mutableCopy];

    //NSLog(@"排序前：%@",[mutableArray formatOutPut]);
    
    //比较次数
    NSInteger checkCount = 0;
    //交换次数
    NSInteger exchangeCount = 0;
    
    for (NSInteger i = 1; i < array.count; i++) {
        for (NSInteger j = i; j > 0 ; j--) {
            
            checkCount++;
            //NSLog(@"比较索引为%ld的值“%@”和索引为%ld的值“%@”",j,mutableArray[j],j-1,mutableArray[j-1]);
            if ([mutableArray[j]integerValue] < [mutableArray[j-1]integerValue]) {
                
                [mutableArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];

                //NSLog(@"%@>%@成立，进行交换",mutableArray[j],mutableArray[j-1]);
                exchangeCount++;
    
                //NSLog(@"排序中：%@\n",[mutableArray formatOutPut]);
            }else{
                //NSLog(@"%@>%@不成立，本次不交换\n",mutableArray[j],mutableArray[j-1]);
                break;
            }
            
        }
    }
    
    
    //NSLog(@"排序后：%@",[mutableArray formatOutPut]);
    NSLog(@"插入排序结束，一共比较%ld次，共进行%ld次交换",checkCount,exchangeCount);
    
}

@end
