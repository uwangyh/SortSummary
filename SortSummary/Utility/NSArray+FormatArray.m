//
//  NSArray+FormatArray.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import "NSArray+FormatArray.h"


@implementation NSArray (FormatArray)

- (NSString *)formatOutPut{
    NSMutableString *oriStr = [[NSMutableString alloc]init];
    for (NSNumber *num in self) {
        [oriStr appendFormat:@"%@ ", [NSString stringWithFormat:@"%@",num]];
    }
    return oriStr;
}
- (void)isLowSort:(NSString *)sortType{
    for (NSInteger i = 0; i < self.count-1; i++) {
        if ([[self objectAtIndex:i]intValue] > [[self objectAtIndex:i+1]intValue]) {
            NSLog(@"\n##########\n##########\n##########\n##########\n本次%@排序出错，在第%ld个元素处\n##########\n##########\n##########\n##########",sortType,i);
            return;
        }
    }
    NSLog(@"\n##########\n##########\n本次%@排序无误\n##########\n##########",sortType);
}

@end
