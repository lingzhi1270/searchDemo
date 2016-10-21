//
//  SearchCell.m
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    SearchCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    if (searchCell == nil) {
        
        searchCell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchCell"];
    }
    return searchCell;

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        CGRect rect = [UIScreen mainScreen].bounds;
        YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectMake(5, 5,CGRectGetWidth(rect)-100, 30)];
        
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @"历史搜索";
        [self.contentView addSubview:label];
        self.nameLabel = label;
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(CGRectGetWidth(rect)-60, 5, 40, 30);
        [button setTitle:@"清空" forState:UIControlStateNormal];
        [button setFont:[UIFont systemFontOfSize:16]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clearAllHistoryData) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        self.clearBtn = button;
        
        
    }
    return self;
    
}

- (void)clearAllHistoryData
{
    if (_clearBlock) {
        _clearBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end


@implementation SearchResultCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    SearchResultCell *resultCell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];
    if (resultCell == nil) {
        
        resultCell = [[SearchResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchResultCell"];
        
    }
    return resultCell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = [UIScreen mainScreen].bounds;
        YYLabel* label = [YYLabel new];
        label.origin = CGPointMake(15, (self.height-16)/2.0);
        label.size = CGSizeMake(CGRectGetWidth(rect)-15*2, 16);
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}

#pragma mark- setter
- (void)setSearchModel:(SearchModel *)searchModel
{
    _searchModel = searchModel;
    self.label.text = searchModel.productName;
    
}

@end
