//
//  DataBaseManager.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "DataBaseManager.h"

#import <MagicalRecord/MagicalRecord.h>

#import "Owner.h"
#import "OwnerModel.h"

#import "Position.h"
#import "PositionModel.h"

#import "Vehicle.h"
#import "VehicleModel.h"

@implementation DataBaseManager

+ (instancetype)sharedInstance {
    static DataBaseManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DataBaseManager new];
    });
    
    return sharedInstance;
}

- (void)addOwners:(NSArray<OwnerModel *> *)ownersModels withCompletion:(DataBaseManagerCompletion)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (OwnerModel *ownerModel in ownersModels) {
            Owner *owner = [Owner createOwner:ownerModel inContext:localContext];
            for (VehicleModel *vehicleModel in ownerModel.vehicles) {
                Vehicle *vehicle = [Vehicle createVehicle:vehicleModel inContext:localContext];
                [vehicle setOwner:owner];
            }
        }
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        if (completion) {
            completion(contextDidSave, error);
        }
    }];
}

- (void)addVehiclesPositions:(NSArray<PositionModel *> *)positionsModels withCompletion:(DataBaseManagerCompletion)completion {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (PositionModel *positionModel in positionsModels) {
            NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %@", VehicleAttributes.vehicleId, positionModel.vehicleId];
            Vehicle *vehicle = [Vehicle MR_findFirstWithPredicate:findPredicate inContext:localContext];
            if (vehicle) {
                [vehicle.position update:positionModel];
            }
        }
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        completion(contextDidSave, error);
    }];
}

@end
