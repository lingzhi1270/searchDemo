//
//  SearchViewController.m
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
#import "SearchView.h"
#import "SearchHeader.h"
#import "CategoryDetailViewController.h"


@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,SearchViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)SearchView *searchView;

@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation SearchViewController

#pragma mark- getter
- (UITableView *)tableView
{
       if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    
//    [_tableView registerClass:[SearchCell class] forCellReuseIdentifier:@"SearchCell"];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.searchView beginSearch];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
    [self.view addSubview:self.tableView];
    [self getSearchData];
    [self setupSearchView];
    
    
    
}

- (void)getSearchData {
    for (int i=0; i<0; i++) {
        SearchModel *model = [[SearchModel alloc]init];
        [self.dataArray addObject:model];
    }
    [_tableView reloadData];
}


- (void)setupSearchView
{
    CGRect rect = [UIScreen mainScreen].bounds;
    self.searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(rect), 30)];
    self.searchView.delegate = self;
    
    __weak __typeof(self)weakSelf = self;
    self.searchView.cancelBlock  = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    self.navigationItem.titleView = self.searchView;
}

#pragma mark- UITableViewDelegate,UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [SearchHeader height];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SearchHeader *header = [[SearchHeader alloc] initWithData:nil];
    header.backgroundColor = [UIColor lightGrayColor];
    __block typeof(self)weakSelf = self;
    header.clickHotProduct= ^(UIButton *sender){
        SearchModel *model = [[SearchModel alloc] init];
        model.productName = [sender titleForState:UIControlStateNormal];
        //给数据源添加值
        [weakSelf.dataArray addObject:model];
        [weakSelf.tableView reloadData];
        [weakSelf getResultVC];
    };
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.dataArray.count +1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    SearchCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell" forIndexPath:indexPath];
    //
    //    return searchCell;
    
    
    if (indexPath.row == 0) {
        __weak typeof(self)weakSelf = self;
        SearchCell *cell = [SearchCell cellWithTableView:tableView];
        cell.clearBlock = ^{
          
            [weakSelf.dataArray removeAllObjects];
            [weakSelf.tableView reloadData];
        };
        return cell;
        
    }
    
    SearchResultCell *resultCell = [SearchResultCell cellWithTableView:tableView];
    resultCell.searchModel = self.dataArray[indexPath.row - 1];
    return resultCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (void)getResultVC {
    [_searchView.searchBar resignFirstResponder];

    CategoryDetailViewController *vc = [[CategoryDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark- SearchViewDelegate

- (void)searchViewSearchButtonClicked:(SearchView *)searchView
{
    SearchModel *model = [[SearchModel alloc] init];
    model.productName = searchView.text;
    [self.dataArray addObject:model];
    [self.tableView reloadData];
    [self getResultVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
