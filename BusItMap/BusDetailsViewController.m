//
//  BusDetailsViewController.m
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "BusDetailsViewController.h"

@interface BusDetailsViewController ()

@end

@implementation BusDetailsViewController

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
	// Do any additional setup after loading the view.
    
    NSLog(@"%@", self.detailsDictionary);
    
    NSString *stopName =  [self.detailsDictionary objectForKey:@"cta_stop_name"];
    self.stopLabel.text = stopName;
    

    NSString *directionOfTravel = [self.detailsDictionary objectForKey:@"direction"];
    self.directionLabel.text = directionOfTravel;
    
    NSString *routes = [self.detailsDictionary objectForKey:@"routes"];
    self.routesLabel.text = routes;
    
    NSString *interModalTransfer = [self.detailsDictionary objectForKey:@"inter_modal"];
    self.transferLabel.text = interModalTransfer;
    
    
    
    
    //object for key dictionary ;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
