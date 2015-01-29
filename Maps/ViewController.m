//
//  ViewController.m
//  Maps
//
//  Created by Użytkownik Gość on 20.01.2015.
//  Copyright (c) 2015 Trzeciak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    if ([CLLocationManager locationServicesEnabled])
    {
        _locationManager = [[CLLocationManager alloc] init];
        _geocoder = [[CLGeocoder alloc] init];
        [_locationManager requestWhenInUseAuthorization];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    }
    _annotation = [[MKPointAnnotation alloc] init];
    [_mapView addAnnotation:_annotation];
    _mapView.showsUserLocation = YES;
    _startLocation = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"location update");
    NSString *currentLatitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.coordinate.latitude];
    _latText.text = currentLatitude;
    
    NSString *currentLongitude = [[NSString alloc]
                                  initWithFormat:@"%+.6f",
                                  newLocation.coordinate.longitude];
    _lonText.text = currentLongitude;
    
    NSString *currentAltitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.altitude];
    
    _altText.text = currentAltitude;
    
    
    NSString *currentSpeed = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.speed];
    
    _speedText.text = currentSpeed;
    
    [self.geocoder reverseGeocodeLocation: newLocation
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           
        NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
        if (error){
            _addrText.text = @"not found";
        }
        
                           
                           if(placemarks && placemarks.count > 0)
                               
                           {
                               //do something
                               CLPlacemark *topResult = [placemarks objectAtIndex:0];
                               NSString *addressTxt = [NSString stringWithFormat:@"%@ %@,%@ %@",
                                                       [topResult subThoroughfare],[topResult thoroughfare],
                                                       [topResult locality], [topResult administrativeArea]];
                               NSLog(@"%@",addressTxt);
                               
                               _addrText.text = addressTxt;
                           } else {
                               
                               _addrText.text = @"not found";
                           }
    }];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.010;
    span.longitudeDelta = 0.010;
    CLLocationCoordinate2D location;
    location.latitude = newLocation.coordinate.latitude;
    location.longitude = newLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [_mapView setRegion:region animated:YES];
    
    [_annotation setCoordinate:newLocation.coordinate];
    [_annotation setTitle:@"Annotation"];

    
    
    
}

- (IBAction)startClicked:(id)sender {
    [_locationManager startUpdatingLocation];
}
- (IBAction)stopClicked:(id)sender {
    [_locationManager stopUpdatingLocation];
}

@end
