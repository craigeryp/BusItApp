//
//  BusStopAnnotationView.m
//  BusItMap
//
//  Created by Craig on 5/21/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "BusStopAnnotationView.h"

@implementation BusStopAnnotationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"mobilemakers.png"];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
