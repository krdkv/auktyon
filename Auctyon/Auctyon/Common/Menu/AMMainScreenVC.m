//
//  AMMainScreenViewController.m
//  Auktyon
//
//  Created by Anton Chebotov on 14/10/14.
//  Copyright (c) 2014 Anton Chebotov. All rights reserved.
//

#import "AMMainScreenVC.h"
#import "AMMenuItem.h"
#import "AMMenuCell.h"
#import "AMMovieVC.h"
#import "AMFilmingVC.h"

@interface AMMainScreenVC () <UITableViewDataSource, UITableViewDelegate>
{
}
@property (weak) IBOutlet UITableView * menuTableView;
@property (weak) IBOutlet UIView * contentView;

@property (strong) UIViewController * visibleVC;
@property (strong) AMMenuItem * selectedItem;
@property (strong) NSMutableArray * items;
@end

@implementation AMMainScreenVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.items = [self createInititalMenuItems];
	[self.menuTableView reloadData];
}


#pragma mark -
#pragma mark Private
- (NSMutableArray *) createInititalMenuItems
{
	NSMutableArray * result = [NSMutableArray new];
	
	AMMenuItem * movieItem = [AMMenuItem new];
	movieItem.name = LS(@"AM_MENU_MOVIE_ITEM_NAME");
	movieItem.imageName = @"AMMenuMovieIcon";
	movieItem.mainVCClassName = @"AMMovieVC";
	[result addObject:movieItem];
	
	AMMenuItem * filmingItem = [AMMenuItem new];
	filmingItem.name = LS(@"AM_MENU_MOVIE_ITEM_NAME");
	filmingItem.imageName = @"AMMenuMovieIcon";
	filmingItem.mainVCClassName = @"AMFilmingVC";
	[result addObject:filmingItem];

	return result;
}


- (UITableViewCell *)getMenuCellWithItem:(AMMenuItem *)item
{
	NSString * cellIdentifier = @"AMMenuCell";
	AMMenuCell *cell = [self.menuTableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = LOAD_VIEW_FROM_NIB_NAMED(cellIdentifier);
	}
	[cell setupWithItem:item];
	return cell;
}

- (void)deleteChildViewController:(UIViewController *)viewController
{
	if (!viewController) {
		return;
	}
	[viewController willMoveToParentViewController:nil];
	[viewController.view removeFromSuperview];
	[viewController removeFromParentViewController];
}

- (void)addChildViewController:(UIViewController *)childController toView:(UIView *)view {
	if (!childController || !view) {
		return;
	}
	if (childController.parentViewController) {
		[self deleteChildViewController:childController];
	}
	[self addChildViewController:childController];
	[view addSubview:childController.view];
	[childController didMoveToParentViewController:self];
}

- (void) pushVisibleVC:(UIViewController *)viewController
{
	[self deleteChildViewController:self.visibleVC];
	
	self.visibleVC = viewController;
	[self addChildViewController:viewController toView:self.contentView];
	[viewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
}


#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger row = indexPath.row;
	AMMenuItem * item = self.items[row];
	UITableViewCell * cell = [self getMenuCellWithItem:item];
	return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 84.0;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	AMMenuCell *cell = (AMMenuCell *)[tableView cellForRowAtIndexPath:indexPath];
	AMMenuItem * itemToSelect = cell.item;
	
	if (itemToSelect == self.selectedItem) {
		return;
	}
	
	self.selectedItem = itemToSelect;
	
	[self pushVisibleVC:itemToSelect.navigationController];
}
@end
