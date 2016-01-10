//
//  DVLayout.m
//  装饰视图
//
//  Created by 吴书敏 on 16/1/8.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DVLayout.h"
#import "DVCollectionReusableView.h"

@interface DVLayout ()

@end

@implementation DVLayout


/*
 调用顺序  当初始化一个UICollectionViewLayout子类的实例后，的执行循序
 
 1. prepareLayout 准备布局，在此方法内设置初始参数 ，注册装饰视图等。
 
 
 2. collectionViewContentSize 集合视图大小：确定collectionView 占据的尺寸，注意：这里是所有内容尺寸，不是可见内容尺寸。
 
 3. layoutAttributesForElementsInRect  返回矩形范围中，每个元素的布局属性，返回值为一个数组
 
 4. 再次执行 collectionViewContentSize 来确定集合内容视图大小，确定滚动范围。
 
 另外，在需要更新layout时，需要给当前layout发送 -invalidateLayout，该消息会立即返回，并且预约在下一个loop的时候刷新当前layout，这一点和UIView的setNeedsLayout方法十分类似。在-invalidateLayout后的下一个collectionView的刷新loop中，又会从prepareLayout开始，依次再调用-collectionViewContentSize和-layoutAttributesForElementsInRect来生成更新后的布局。
 */

// 1. preparLayout准备布局方法
- (void)prepareLayout
{
    // 1. 调用super 准备布局
    [super prepareLayout];
    
    // 2. 注册 装饰视图 重用标识符dv1
    [self registerClass:[DVCollectionReusableView class] forDecorationViewOfKind:@"dv1"];
    
    
    // 3. 提供布局信息
    self.attributesArray = [NSMutableArray array];
    
   

}


// 2. 返回collectionView的内容大小的尺寸
- (CGSize)collectionViewContentSize
{
    // 这里返回集合视图的frame大小,或者collectionView的contentSize大小。
    
    // 竖直滚动 没有考虑区头区尾情况
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat height = 125 * self.collectionView.numberOfSections;
    
    return CGSizeMake(width, height);
}


// 每个增补视图的布局属性
// 参数1 elementKind 修饰视图标识符（重用标识符）
// 参数2 indexPath 修饰视图下标
- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    // 1. 创建对象
    UICollectionViewLayoutAttributes *decorationAtt = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    
    // 2. 赋值 frame边框 zIndex z轴下标
    // width = （总宽度-左边距-右边距）/ 列数
    CGFloat width = self.collectionView.frame.size.width;
    
    // height = 装饰图片高度/@x分辨率
    CGFloat height = 125;
    
    CGFloat attX = 0;
    
    CGFloat attY = indexPath.section * height;
    
    decorationAtt.frame = CGRectMake(attX, attY, width, height);
    
    // zIndex
    decorationAtt.zIndex = -1;
    
    // 添加到数组中
    [self.attributesArray addObject:decorationAtt];
    
    
    return decorationAtt;
    
}

// 每个单元格的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *itemArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // x y width height
    CGFloat itemWidth = self.itemSize.width;
    CGFloat itemHeight = self.itemSize.height;
    CGFloat itemX = self.sectionInset.left + indexPath.item % _numberOfColumn * (itemWidth + self.minimumInteritemSpacing);
    CGFloat itemY = self.sectionInset.top +  indexPath.section * 125;
    itemArr.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
    
    // 添加到数组中
    [self.attributesArray addObject:itemArr];
    
    return itemArr;
}


// 3. 布局属性数组, 确定每个单元格的位置，注意：该方法确定的是单元格的位置，不是装饰视图位置。
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
     // (1) 单元格布局信息， 网格布局 大小单元格 大小相同
     // 影响布局的因素  分区下标  列下标
     // section总数
     NSInteger sectionNumber = self.collectionView.numberOfSections;
    
     for (int section = 0; section < sectionNumber; section ++)
     {
         
         // 装饰视图属性
         NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
         [self layoutAttributesForDecorationViewOfKind:@"dv1" atIndexPath:indexPath];
         
         
         // 某个分区内的item总数
         NSInteger itemNumber = [self.collectionView numberOfItemsInSection:section];
         
         for (int item = 0; item < itemNumber; item++)
         {
             NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
             
             [self layoutAttributesForItemAtIndexPath:indexPath];
             
         }
     }
    
    return self.attributesArray;
}


// 返回rect中的所有的元素的布局属性
// 返回的是包含UICollectionViewLayoutAttributes的NSArray
//

/*
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 通过不同的方法，返回不同的attributes
    
    
    
    
    
    // 默认返回为nil
//    return nil;
}
 */















@end
