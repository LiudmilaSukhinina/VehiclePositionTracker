//
//  PositionModel.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "PositionModel.h"

@implementation PositionModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *vehicleId = dictionary[@"vehicleid"];
    if (vehicleId == nil) {
        return nil;
    }
    
    self = [super initWithDictionary:dictionary];
    
    if (self) {
        _vehicleId = vehicleId;
 
        if (dictionary[@"lon"] != (id)[NSNull null])
        {
           self.longitude = [dictionary[@"lon"] doubleValue];
        } else {
            self.longitude = 0.0;
        }
        
        if (dictionary[@"lat"]  != (id)[NSNull null])
        {
           self.latitude = [dictionary[@"lat"] doubleValue];
        } else {
            self.latitude = 0.0;
        }
    }
    
    return self;
}

@end
