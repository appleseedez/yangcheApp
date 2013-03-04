//
//  YCMapViewController.m
//  yangcheApp
//
//  Created by Pharaoh on 13-1-21.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "YCMapViewController.h"
#import "YCAutoServiceDetailViewController.h"
#import "YCMocManager.h"
#import "AutoService.h"
#import <CoreLocation/CoreLocation.h>
@interface YCMapViewController (){
	YCMocManager* mocManager;
	AutoService* autoService;
	CLLocationManager* myLocationManager;
	CLLocation* currentLocation;
	CLGeocoder* myGeocoder;
}

@end

@implementation YCMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// DAO服务
	mocManager = [[YCMocManager alloc] init];
	// 根据manageObject的全局URL获取该数据对象
	autoService = [mocManager fetchByURI:self.moURI];
	
	if ([CLLocationManager locationServicesEnabled]) {
		// 能用SignificantLocationChange尽量用,省电哈
		myLocationManager = [[CLLocationManager alloc] init];
		myLocationManager.delegate = self;
		// SignificantLocationChange 不需要指定这两项
		//myLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
		//myLocationManager.distanceFilter = 500;
		myGeocoder = [[CLGeocoder alloc] init];
	}
}

- (void)viewWillAppear:(BOOL)animated{
	// 能用SignificantLocationChange尽量用,省电哈
	//[myLocationManager startUpdatingLocation];
	[myLocationManager startMonitoringSignificantLocationChanges];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	if([segue.identifier isEqualToString:@"backToServiceDetailFromMap"]){
		YCAutoServiceDetailViewController* detailViewController = [segue destinationViewController];
		detailViewController.moURI = [[autoService objectID] URIRepresentation];
	}
}

#pragma mark - location delegate
// ios5 使用
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
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
	self.mapView.showsUserLocation = YES;
	[myLocationManager stopMonitoringSignificantLocationChanges]; 
	//[myLocationManager stopUpdatingLocation];
	// 如果更新时间
	//NSDate* eventDate = currentLocation.timestamp;
	//NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	//if (abs(howRecent)<10.0) {

	
	[myGeocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error){
		if (error == nil && [placemarks count]>0) {
			CLPlacemark* mark = [placemarks lastObject];
			NSString* locationAt = [[[mark addressDictionary] valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
			
			self.mapView.userLocation.title = locationAt;
			self.mapView.userLocation.subtitle = @"我在这里";
			
			MKCoordinateRegion theRegion;
			theRegion.center= [[myLocationManager location] coordinate];
			//缩放的精度。数值越小约精准
			theRegion.span.longitudeDelta = 0.05f;
			theRegion.span.latitudeDelta = 0.05f;
			//让MapView显示缩放后的地图。
			[self.mapView setRegion:theRegion animated:YES];
			
//			MKCircle* circle = [MKCircle circleWithCenterCoordinate:[[myLocationManager location] coordinate] radius:10];
//			[self.mapView addAnnotation:circle];
		}
	}];
	//}
	
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
}
@end
