//
//  ViewController.m
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "ViewController.h"
#import "BusStops.h"
#import "BusDetailsViewController.h"
#import "BusStopAnnotationView.h"

@interface ViewController ()
{
    NSMutableArray *rowArray;

    BusStops *selectedBusStop;
    NSString *Transfer;
}

-(void) generateURLRequest;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(41.90, -87.65);
    MKCoordinateSpan span = MKCoordinateSpanMake (0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    
    
    self.mapView.region = region;
    

    
    [self generateURLRequest];
    
    
    

    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



-(void) generateURLRequest
{
    NSString *busURLString = [NSString stringWithFormat:@"http://www.heliumfoot.com/files/mobilemakers/bus.json"];
    NSURL *url = [NSURL URLWithString:busURLString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *urlResponse, NSData *data, NSError *error)
     {
         NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
         
         rowArray = [responseDictionary objectForKey:@"row"];
         NSLog(@"Row has %i",rowArray.count);
         
         for (NSMutableDictionary *dictionary in rowArray ) {
             NSString *latitude = [dictionary objectForKey:@"latitude"];
             NSString *longitude = [dictionary objectForKey:@"longitude"];
             NSString *stopName = [dictionary objectForKey:@"cta_stop_name"];
             NSString *routes = [dictionary objectForKey:@"routes"];
             Transfer = [dictionary objectForKey:@"inter_modal"];
        

             BusStops *busStop = [[BusStops alloc]init];
             busStop.coordinate  = CLLocationCoordinate2DMake ([latitude floatValue], [longitude floatValue]);
             busStop.title = stopName;
             busStop.subtitle = routes;
             busStop.busStopDictionary = dictionary;
             [self.mapView addAnnotation:busStop];
             
             //create global dictionary in BusStops add this in the 
             
             
             
             
             

         }
         
     }];
    
}

//-(void) colorMEthod
//
//{
//    if (transfer == @"Pace") {
//        MKAnnotationView *annotationView = [[BusStopAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
//        annotationView.canShowCallout = YES;
//        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        ((MKPinAnnotationView *)(annotationView)).animatesDrop = YES;
//        
//
//    } else if ([Transfer isEqual: @"Metra"]){
//        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
//        annotationView.canShowCallout = YES;
//        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        ((MKPinAnnotationView *)(annotationView)).animatesDrop = YES;
//        
//    } else {
//        annotationView.annotation = annotation;
//    }
//
//
//    }
//}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation

{
    NSString *reuseIdentifier= @"myIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    
    if (annotationView == nil) {
        
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        ((MKPinAnnotationView *)(annotationView)).animatesDrop = YES;
        
    } else {
        annotationView.annotation = annotation;
    }
    
    return annotationView;
    
    
    
    
}

//when you hit the disclosure button
-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    selectedBusStop = ((BusStops *)(view.annotation));
    [self performSegueWithIdentifier:@"pushDetails" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
    BusDetailsViewController *busDetailsViewController = [segue destinationViewController];
    
    busDetailsViewController.detailsDictionary = selectedBusStop.busStopDictionary;
    //busDetailsViewController.busStopObject = ((BusStops *) busStopArray[indexPath.row]);
  // *selectedAnnotations
    
}







@end
