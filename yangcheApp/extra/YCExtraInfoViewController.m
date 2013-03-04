//
//  YCExtraInfoViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-28.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCExtraInfoViewController.h"
#import "PKRevealController.h"
@interface YCExtraInfoViewController (){
	CLLocationManager* locationManager;
	CLLocation* currentLocation;
	CLGeocoder* myGeocoder;
}

@end

@implementation YCExtraInfoViewController

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

}

- (void)viewWillAppear:(BOOL)animated{
	if (nil == locationManager) {
		locationManager = [[CLLocationManager alloc] init];
	}
	if (nil == myGeocoder) {
		myGeocoder = [[CLGeocoder alloc] init];
	}
	
	locationManager.delegate = self;
	[locationManager startMonitoringSignificantLocationChanges];
}

- (void)viewWillDisappear:(BOOL)animated{
	[locationManager stopMonitoringSignificantLocationChanges];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
    return 2;
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


# pragma mark - location delegate
// ios5 用的
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	NSArray* locations;
	if (oldLocation != nil) {
		locations = @[oldLocation,newLocation];
	}else{
		locations = @[newLocation];
	}
	 
	[self locationManager:manager didUpdateLocations:locations];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
	currentLocation = [locations lastObject];
	self.currentPositionMapView.showsUserLocation = YES;
	//[locationManager stopMonitoringSignificantLocationChanges];
	//[myLocationManager stopUpdatingLocation];
	// 如果更新时间
	//NSDate* eventDate = currentLocation.timestamp;
	//NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	//if (abs(howRecent)<10.0) {

	
	[myGeocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error){
		if (error == nil && [placemarks count]>0) {
			CLPlacemark* mark = [placemarks lastObject];
			NSString* locationAt = [[[mark addressDictionary] valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
			
			self.currentPositionMapView.userLocation.title = locationAt;
			self.currentPositionMapView.userLocation.subtitle = @"我在这里";
			
			self.currentPositionLabelView.text = locationAt;
			
			MKCoordinateRegion theRegion;
			theRegion.center= [[locationManager location] coordinate];
			//缩放的精度。数值越小约精准
			theRegion.span.longitudeDelta = 0.01f;
			theRegion.span.latitudeDelta = 0.01f;
			//让MapView显示缩放后的地图。
			[self.currentPositionMapView setRegion:theRegion animated:YES];
//			MKCircle* circle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(self.currentPositionMapView.userLocation.location.coordinate.latitude, self.currentPositionMapView.userLocation.location.coordinate.longitude) radius:5000];
//			[self.currentPositionMapView addAnnotation:circle];
			
		}
	}];
	//}
		
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
}

# pragma mark - textview delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
	self.currentPositionLabelView.text = @"";
	// 进入全屏模式
//	if (![self.revealController isPresentationModeActive])
//    {
//        [self.revealController enterPresentationModeAnimated:YES
//                                                  completion:NULL];
//    }
//    else
//    {
//        [self.revealController resignPresentationModeEntirely:NO
//                                                     animated:YES
//                                                   completion:NULL];
//    }
	
	return YES;
}

@end
