//
//  YCNotifyIndexViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-27.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCNotifyIndexViewController.h"
#import "YCNotifyIndexCell.h"
#import "YCMocManager.h"
#import "Notify.h"
#import "UIImageView+AFNetworking.h"
@interface YCNotifyIndexViewController (){
	NSMutableArray* results;
	YCMocManager* mocManager;
}

@end

@implementation YCNotifyIndexViewController

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
	mocManager = [[YCMocManager alloc] init];

	

	
}


- (void)viewWillAppear:(BOOL)animated{
	// 加载通知
	results = [[NSMutableArray alloc] initWithArray:[mocManager fetchNotifies]];
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - load notify
- (void)loadNotifies{
	results = [[NSMutableArray alloc] initWithArray:[mocManager fetchNotifies]];
	[self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"NotifyItemCell";
    YCNotifyIndexCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
		cell = [[YCNotifyIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    Notify* notify = [results objectAtIndex:indexPath.row];
    cell.notifyTitleView.text = notify.title;
	[cell.notifyIconView setImageWithURL:[NSURL URLWithString:notify.type] placeholderImage:[UIImage imageNamed:@"21-wrench"]];
	
	
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

@end
