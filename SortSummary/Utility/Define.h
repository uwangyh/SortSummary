//
//  Define.h
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#ifndef Define_h
#define Define_h

#import "NSArray+FormatArray.h"

#import "BubbleSortManager.h"
#import "SelectionSortManager.h"
#import "InsertionSortManager.h"

#import "QuickSortManager.h"

//可以在这里设置排序过程详细log的开关
#if 0
#   define HHLog(fmt, ...) {NSLog((fmt),##__VA_ARGS__);}
/*
#   define HHLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}

#   define HHLog(fmt, ...) NSLog((@"%s," "[lineNum:%d]" fmt) , __FUNCTION__, __LINE__, ##__VA_ARGS__); //带函数名和行数

#   define hhLog(fmt, ...) NSLog((@"===[lineNum:%d]" fmt), __LINE__, ##__VA_ARGS__);  //带行数

#   define hhLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__); //不带函数名和行数
 */
#else
#   define HHLog(...)
#endif

#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])

#endif /* Define_h */
