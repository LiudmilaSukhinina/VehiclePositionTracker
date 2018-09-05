//
//  VehicleModel.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "VehicleModel.h"

@implementation VehicleModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *vehicleId = dictionary[@"vehicleid"];
    if (vehicleId == nil) {
        return nil;
    }
    
    self = [super initWithDictionary:dictionary];
    
    if (self) {
        _vehicleId = [vehicleId integerValue];
        _color = dictionary[@"color"];
        _make = dictionary[@"make"];
        _vin = dictionary[@"vin"];
        _model = dictionary[@"model"];
        _foto = dictionary[@"foto"];
        _year = [dictionary[@"year"] integerValue];
    }
    
    return self;
}

@end
