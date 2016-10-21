//
//  ViewController.m
//  SearchDemo
//
//  Created by lingzhi on 2016/10/19.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Block.h"
#import "SearchViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *leftBtn;

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setLeftImageNamed:@"searchicon" action:@selector(search)];
    
}

- (void)setLeftImageNamed:(NSString *)name action:(SEL)action
{
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _leftBtn.frame = CGRectMake(0, 0, 24, 24);
    
    UIImage *image = [UIImage imageNamed:name];
    
    [_leftBtn setImage:image forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    __weak __typeof(self)weakSelf = self;
    
    [_leftBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        if (!action) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    
}

- (void)search
{
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
