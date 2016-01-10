//
//  DVCollectionReusableView.m
//  装饰视图
//
//  Created by 吴书敏 on 16/1/8.
//  Copyright © 2016年 littledogboy. All rights reserved.
//

#import "DVCollectionReusableView.h"

@implementation DVCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView.image = [UIImage imageNamed:@"background"];
        
        [self addSubview:_imageView];
    }
    
    return self;
}

@end
