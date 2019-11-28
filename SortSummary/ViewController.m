//
//  ViewController.m
//  SortSummary
//
//  Created by WangYonghe on 2019/11/28.
//  Copyright © 2019 WangYonghe. All rights reserved.
//

#import "ViewController.h"
#import "BubbleSortManager.h"
#import "SelectionSortManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *sourceArr = @[@8,@3,@5,@10,@1,@6,@4,@2,@7,@9];
 
    //冒泡排序
    [BubbleSortManager startBubbleSortWithDataArray:sourceArr];
    
    //选择排序
    //[SelectionSortManager startSelectionSortWithDataArray:sourceArr];
    
}


@end
