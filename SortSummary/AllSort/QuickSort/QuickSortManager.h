//
//  QuickSortManager.h
//  SortSummary
//
//  Created by WangYonghe on 2019/11/29.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LeftEle = 0,
    RightEle,
    MiddleEle,
} PivotIndex;

NS_ASSUME_NONNULL_BEGIN

@interface QuickSortManager : NSObject

+ (instancetype)shareInstance;

- (void)startQucikSortWithDataArray:(NSArray *)array pivotIndex:(PivotIndex)index block:(void(^)(NSString *))block;

@end

NS_ASSUME_NONNULL_END
