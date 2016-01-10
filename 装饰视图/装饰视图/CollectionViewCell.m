//
//  CollectionViewCell.m
//  装饰视图
//
//  Created by 吴书敏 on 16/1/9.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.image = [UIImage imageNamed:@"avatar2.jpg"];
        [self.contentView addSubview:_imageView];
        
    }
    
    return self;
}

@end
