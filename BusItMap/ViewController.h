//
//  ViewController.h
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end
