//
//  ViewController.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *sourceArr = @[@8,@3,@5,@10,@1,@6,@4,@2,@7,@9];

    //冒泡排序
    //[BubbleSortManager startBubbleSortWithDataArray:sourceArr];
    
    //选择排序
    //[SelectionSortManager startSelectionSortWithDataArray:sourceArr];
    
    //选择排序
    //[InsertionSortManager startInsertionSortWithDataArray:sourceArr];
    
    
    //NSArray *sourceArr = @[@8,@1,@1];
    
    //快速排序
    [QucikSortManager sort:[sourceArr mutableCopy] left:0 right:sourceArr.count-1];
    NSLog(@"#############");
    //[QucikSortManager qucickSort:[sourceArr mutableCopy] low:0 high:sourceArr.count-1];
    
}


@end
