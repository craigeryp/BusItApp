//
//  BusDetailsViewController.h
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusStops.h"


@interface BusDetailsViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *stopLabel;
@property (strong, nonatomic) IBOutlet UILabel *directionLabel;
@property (strong, nonatomic) IBOutlet UILabel *routesLabel;
@property (strong, nonatomic) IBOutlet UILabel *transferLabel;


@property (strong, nonatomic) NSMutableDictionary *detailsDictionary;

@end
