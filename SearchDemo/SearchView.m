//
//  SearchView.m
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "SearchView.h"


@interface SearchView()<UISearchBarDelegate>

@end

@implementation SearchView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    if (self) {
        UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(rect)-70, 30)];
        [searchbar setSearchBarStyle:UISearchBarStyleMinimal];
        [searchbar setDelegate:self];
        self.searchBar = searchbar;
        [self addSubview:self.searchBar];
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(_searchBar.frame.size.width+10, 0, 50, 30);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        }
    
    return self;
}

- (void)beginSearch
{
    [self.searchBar becomeFirstResponder];
    
}


- (void)pop
{
    [self.searchBar resignFirstResponder];
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (NSString *)text
{
    return self.searchBar.text;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchViewShouldBeginEditing:)]) {
        [self.delegate searchViewShouldBeginEditing:self];
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewTextDidBeginEditing:)]) {
        [_delegate searchViewTextDidBeginEditing:self];
    }
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewShouldEndEditing:)]) {
        [_delegate searchViewShouldEndEditing:self];
    }
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewTextDidEndEditing:)]) {
        [_delegate searchViewTextDidEndEditing:self];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchView:textDidChange:)]) {
        [_delegate searchView:self textDidChange:searchText];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (_delegate&&[_delegate respondsToSelector:@selector(searchViewSearchButtonClicked:)]) {
        [_delegate searchViewSearchButtonClicked:self];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
