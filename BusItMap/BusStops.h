//
//  BusStops.h
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BusStops : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *interModalTransfer;


@property (nonatomic, copy) NSMutableDictionary *busStopDictionary;




@end
