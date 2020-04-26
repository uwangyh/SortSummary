//
//  NSArray+FormatArray.h
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (FormatArray)

- (NSString *)formatOutPut;
- (void)isLowSort:(NSString *)sortType;

@end

NS_ASSUME_NONNULL_END
