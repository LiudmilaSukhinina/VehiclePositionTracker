//
//  DataBaseManager.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataBaseManagerCompletion)(BOOL contextDidSave, NSError *error);

@class OwnerModel, PositionModel;

@interface DataBaseManager : NSObject

+ (instancetype)sharedInstance;

- (void)addOwners:(NSArray<OwnerModel *> *)ownersModels withCompletion:(DataBaseManagerCompletion)completion;
- (void)addVehiclesPositions:(NSArray<PositionModel *> *)positionsModels withCompletion:(DataBaseManagerCompletion)completion;


@end
