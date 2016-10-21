//
//  SearchHeader.h
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^SearchHeaderBlock)(UIButton *sender);
@interface SearchHeader : UIScrollView

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,copy)SearchHeaderBlock clickHotProduct;

- (instancetype)initWithData:(NSArray *)data;

+ (CGFloat)height;

@end
