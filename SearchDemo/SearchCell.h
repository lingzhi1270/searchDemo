//
//  SearchCell.h
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "YYKit.h"
#import "SearchModel.h"

typedef void(^SearchCellBlock)();

@interface SearchCell : UITableViewCell

@property (nonatomic,strong)YYLabel *nameLabel;
@property (nonatomic,strong)UIButton *clearBtn;

@property (nonatomic,copy)SearchCellBlock clearBlock;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end



@interface SearchResultCell : UITableViewCell

@property (nonatomic,strong)YYLabel *label;

@property (nonatomic,strong)SearchModel *searchModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
