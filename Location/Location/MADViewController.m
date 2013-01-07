//
//  MADViewController.m
//  Location
//
//  Created by Ben Leduc-Mills on 11/29/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"

@interface MADViewController () {
    CLLocationManager *locationManager;
    MADAnnotation *annotation;
   
}

@end

@implementation MADViewController
@synthesize latitudeTextField;
@synthesize longitudeTextField;
@synthesize altitudeTextField;
@synthesize accuracyTextField;
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager=[[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    mapView.delegate=self;
    mapView.mapType=MKMapTypeHybrid;
    //[self.view addSubview:mapView];
}

- (void)viewDidUnload
{
    [self setLatitudeTextField:nil];
    [self setLongitudeTextField:nil];
    [self setAltitudeTextField:nil];
    [self setAccuracyTextField:nil];
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    latitudeTextField.text=[[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.latitude];
    longitudeTextField.text=[[NSString alloc]initWithFormat:@"%f", newLocation.coordinate.longitude];
    altitudeTextField.text=[[NSString alloc]initWithFormat:@"%f", newLocation.altitude];
    accuracyTextField.text=[[NSString alloc]initWithFormat:@"%f", newLocation.horizontalAccuracy];
    
    MKCoordinateSpan span;
    span.latitudeDelta=.001;
    span.longitudeDelta=.001;
    MKCoordinateRegion region;
    region.center=newLocation.coordinate;
    region.span=span;
    [mapView setRegion:region animated:YES];
    
    if(annotation){
        [annotation moveAnnotation:newLocation.coordinate];
    }
    else {
        annotation=[[MADAnnotation alloc] initWithCoordinate:newLocation.coordinate];
        [mapView addAnnotation:annotation];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Error obtaining location" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
