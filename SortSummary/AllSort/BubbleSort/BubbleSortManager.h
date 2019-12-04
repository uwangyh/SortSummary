//
//  BubbleSortManager.h
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void(^CompleteBlock)(NSString *resDesc);

NS_ASSUME_NONNULL_BEGIN

@interface BubbleSortManager : NSObject


+ (void)startBubbleSortWithDataArray:(NSArray *)array block:(void(^)(NSString *))block; 

@end

NS_ASSUME_NONNULL_END
