//
//  OwnerModel.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "OwnerModel.h"
#import "VehicleModel.h"

@implementation OwnerModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *userId = dictionary[@"userid"];
    if (userId == nil) {
        return nil;
    }
    
    self = [super initWithDictionary:dictionary];
    
    if (self) {
        _userId = [userId integerValue];
        
        NSDictionary *ownerDictionary = dictionary[@"owner"];
        if (ownerDictionary) {
            _name = ownerDictionary[@"name"];
            _surname = ownerDictionary[@"surname"];
            _foto = ownerDictionary[@"foto"];
        }
        
        NSArray<NSDictionary *> *vehiclesDictionaries = dictionary[@"vehicles"];
        if (vehiclesDictionaries) {
            NSMutableArray *vehicles = [NSMutableArray arrayWithCapacity:vehiclesDictionaries.count];
            for (NSDictionary *vehicleDictionary in vehiclesDictionaries) {
                VehicleModel *responseVehicle = [[VehicleModel alloc] initWithDictionary:vehicleDictionary];
                [vehicles addObject:responseVehicle];
            }
            _vehicles = vehicles;
        }
    }
    return self;
}

@end
