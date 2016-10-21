//
//  SearchHeader.m
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "SearchHeader.h"
#import "YYKit.h"


@interface SearchHeader ()

@end

@implementation SearchHeader

- (instancetype)initWithData:(NSArray *)data
{
    self = [super init];
    if (self)
    {
        if (!data)
        {
            data = @[@"iPhone",@"iPad",@"海外购",@"黄金",@"家电",@"日用"];
        }
        _dataArray = data;

        self.origin = CGPointMake(0, 0);
        self.size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 44);
        
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        
        [self commonInit];
        
    }
    return self;
}

- (void)commonInit {
    
    YYLabel *label = [YYLabel new];
    label.origin = CGPointMake(10, (self.height-15)/2.0);
    label.size = CGSizeMake(100, 15);
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.text = @"热门搜索";
    [self addSubview:label];
    [label sizeToFit];
    
    __block CGFloat w = 0 ,margin = 8;
    [_dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                        NSUInteger idx,
                                        BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGFloat length = [obj boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        button.frame = CGRectMake((idx == 0) ? label.right+10 : 10 + w, margin, length + 15 , self.height-margin*2);
        w = button.right;
        button.layer.cornerRadius = 8.0;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = idx + 1;
        [button setTitle:_dataArray[idx] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel sizeToFit];
        [button addTarget:self action:@selector(clickProduct:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
    self.contentSize = CGSizeMake(label.right+_dataArray.count*60+(_dataArray.count+1)*10, self.height);
}

- (void)clickProduct:(UIButton *)sender {
    if (_clickHotProduct) {
        _clickHotProduct(sender);
    }
}

+ (CGFloat)height
{
    return 44;
}

@end
