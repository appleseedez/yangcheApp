//
//  YCExtraInfoViewController.h
//  yangcheApp
//
//  Created by Pharaoh on 13-2-28.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface YCExtraInfoViewController : UITableViewController <UITextFieldDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *currentPositionIconView;
@property (weak, nonatomic) IBOutlet UILabel *currentPositionLabelView;

@property (weak, nonatomic) IBOutlet MKMapView *currentPositionMapView;

@end
