//
//  YCGlobalSearchViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-3-5.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCGlobalSearchViewController.h"

@interface YCGlobalSearchViewController (){
	NSMutableArray* defaultResults;
	NSMutableArray* fileterKeys;
	//UISearchBar* globalSearchBar;
	//UISearchDisplayController* searchDC;
}

@end

@implementation YCGlobalSearchViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//globalSearchBar = [[NSBundle mainBundle] loadNibNamed:@"GlobalSearchBarView" owner:self options:nil][0];
	//globalSearchBar.delegate = self;
	UIImage *bg = [[UIImage imageNamed:@"nav_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
	[[UISearchBar appearance] setBackgroundImage:bg];
	//self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:globalSearchBar];
	//searchDC = self.searchDisplayController;
	self.globalSearchBar.scopeButtonTitles = @[@"全部",@"服务",@"店铺"];
	//searchDC.delegate = self;
	//searchDC.searchResultsDelegate = self;
	//searchDC.searchResultsDataSource = self;
	defaultResults = [@[@"One",@"Two",@"Three"] mutableCopy];
	self.globalSearchBar.showsCancelButton = NO;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [defaultResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    cell.textLabel.text = defaultResults[indexPath.row];
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark - UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
	[searchBar resignFirstResponder];
	searchBar.showsScopeBar = NO;
	[self.searchDisplayController setActive:NO animated:YES];
	
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
	searchBar.showsScopeBar =YES;
	[self.searchDisplayController setActive:YES animated:YES];
	searchBar.showsCancelButton = NO;
	return YES;
}




#pragma mark - UISearchBarDisplayController delegate

@end
