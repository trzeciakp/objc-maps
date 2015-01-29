//
//  ViewController.h
//  Maps
//
//  Created by Użytkownik Gość on 20.01.2015.
//  Copyright (c) 2015 Trzeciak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController
<CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *latText;
@property (weak, nonatomic) IBOutlet UILabel *lonText;
@property (weak, nonatomic) IBOutlet UILabel *altText;
@property (weak, nonatomic) IBOutlet UILabel *addrText;
@property (weak, nonatomic) IBOutlet UILabel *speedText;
@property (weak, nonatomic) IBOutlet UILabel *headText;
@property (weak, nonatomic) IBOutlet UIButton *startTrackingButton;
@property (weak, nonatomic) IBOutlet UIButton *stopTrackingButton;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLLocation *startLocation;
@property (strong, nonatomic) CLLocation *lastLocation;
@property (strong, nonatomic) MKPointAnnotation *annotation;


- (IBAction)startClicked:(id)sender;
- (IBAction)stopClicked:(id)sender;

@end

