//
//  YCMapViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-21.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface YCMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak,nonatomic) NSURL* moURI;
@end
