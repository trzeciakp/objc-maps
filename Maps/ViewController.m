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
        [_locationManager requestWhenInUseAuthorization];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    }
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
    
    
}

@end
