//
//  Route.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "Route.h"

@implementation Route

- (instancetype)initWithGoogleRouteString:(NSString *)googleRouteString {
    self = [super init];
    
    if (self) {
        _googleRouteString = googleRouteString;
    }
    
    return self;
}

@end
