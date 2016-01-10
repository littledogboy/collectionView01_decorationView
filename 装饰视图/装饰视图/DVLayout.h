//
//  DVLayout.h
//  装饰视图
//
//  Created by 吴书敏 on 16/1/8.
//  Copyright © 2016年 littledogboy. All rights reserved.
//  自定义布局  1个元素

#import <UIKit/UIKit.h>

@interface DVLayout : UICollectionViewFlowLayout

// 1. 从父类继承的属性  itemSize sectionEdge 不再重写

// 2. 列数  方便使用
@property (nonatomic, assign) NSInteger numberOfColumn;

// 3. contentSize
@property (nonatomic, assign) CGSize contentSize;




// 3. 存储元素属性的数组
@property (nonatomic, strong) NSMutableArray *attributesArray;



/*
 
 
  正确的做法，给出item 在分区中距离上面，距离下面距离左边，距离右边， 这个由sectionEdge决定，那么itemsize，的y值应该计算正确
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */


@end
