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

@end
