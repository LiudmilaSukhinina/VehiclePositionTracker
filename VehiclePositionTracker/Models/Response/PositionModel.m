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
        self.longitude = [dictionary[@"lon"] doubleValue];
        self.latitude = [dictionary[@"lat"] doubleValue];
    }
    
    return self;
}

@end
