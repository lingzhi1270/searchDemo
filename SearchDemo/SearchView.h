//
//  SearchView.h
//  SearchViewController
//
//  Created by lingzhi on 2016/10/11.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SearchViewBlock)();



@protocol SearchViewDelegate;
@interface SearchView : UIView


@property (nonatomic,strong)UISearchBar *searchBar;

@property (nonatomic,copy)SearchViewBlock cancelBlock;

@property (nonatomic,assign)id<SearchViewDelegate>delegate;

@property (nonatomic,strong)NSString *text;

- (void)beginSearch;

@end

@protocol SearchViewDelegate <NSObject>
@optional;

- (BOOL)searchViewShouldBeginEditing:(SearchView *)searchView;                      // return NO to not become first responder
- (void)searchViewTextDidBeginEditing:(SearchView *)searchView;                     // called when text starts editing
- (BOOL)searchViewShouldEndEditing:(SearchView *)searchView;                        // return NO to not resign first responder
- (void)searchViewTextDidEndEditing:(SearchView *)searchView;                       // called when text ends editing
- (void)searchView:(SearchView *)searchView textDidChange:(NSString *)searchText;

- (void)searchViewSearchButtonClicked:(SearchView *)searchView;

@end
