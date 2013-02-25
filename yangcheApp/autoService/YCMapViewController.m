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
		myLocationManager = [[CLLocationManager alloc] init];
		myLocationManager.delegate = self;
		myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
		myLocationManager.distanceFilter = 1000.0f;
		myGeocoder = [[CLGeocoder alloc] init];
	}
}

- (void)viewWillAppear:(BOOL)animated{
	[myLocationManager startUpdatingLocation];
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
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
	currentLocation = [locations lastObject];
	self.mapView.showsUserLocation = YES;
	[myLocationManager stopUpdatingLocation];
	MKCircle* circle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(self.mapView.userLocation.location.coordinate.latitude, self.mapView.userLocation.location.coordinate.longitude) radius:5000];
	[self.mapView addAnnotation:circle];
	
	[myGeocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error){
		if (error == nil && [placemarks count]>0) {
			CLPlacemark* mark = [placemarks lastObject];
			NSString* locationAt = [[[mark addressDictionary] valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
			
			self.mapView.userLocation.title = locationAt;
			self.mapView.userLocation.subtitle = @"我在这里";
			
			MKCoordinateRegion theRegion = { {0.0, 0.0 }, { 0.0, 0.0 } };
			theRegion.center= self.mapView.userLocation.location.coordinate;
			//缩放的精度。数值越小约精准
			theRegion.span.longitudeDelta = 0.01f;
			theRegion.span.latitudeDelta = 0.01f;
			//让MapView显示缩放后的地图。
			[self.mapView setRegion:theRegion animated:YES];
			

		}
	}];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
}
@end
