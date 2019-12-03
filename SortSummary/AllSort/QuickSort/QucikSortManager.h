//
//  QucikSortManager.h
//  SortSummary
//
//  Created by WangYonghe on 2019/11/29.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QucikSortManager : NSObject

+ (void)startQucikSortWithDataArray:(NSArray *)array;
+ (void)qucickSort:(NSMutableArray *)m low:(int)low high:(int)high;
+ (void)sort:(NSArray *)array left:(int)left right:(int)right;
@end

NS_ASSUME_NONNULL_END
