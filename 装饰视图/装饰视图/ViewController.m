//
//  ViewController.m
//  装饰视图
//
//  Created by 吴书敏 on 16/1/8.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "ViewController.h"
#import "DVLayout.h"
#import "DVCollectionReusableView.h"
#import "CollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建自定义layout
    DVLayout *layout = [[DVLayout alloc] init];
    
    // 行间距
    layout.minimumLineSpacing = 10;
    
    // 列间距
    layout.minimumInteritemSpacing = 10;
    
    // 间距
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 0);
    
    // 列数
    layout.numberOfColumn = 3;
    
    // itemSize
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * 10 - 2 * 10) / 3.0;
    CGFloat height = 0.8 * width;
    layout.itemSize = CGSizeMake(width, height);
    
    //
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    // 2. collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
    [self.view addSubview:collectionView];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark-
#pragma mark dataSource
// 分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
    
}

// 分区item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

// 加载单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
