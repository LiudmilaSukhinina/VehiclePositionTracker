//
//  UserVehiclesDataSource.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VehicleMapMarker.h"

@class Route, Vehicle;

@interface UserVehiclesDataSource : NSObject

@property (nonatomic, strong) NSArray<VehicleMapMarker *> *markers;

- (void)setVehiclesByOwnerId:(NSNumber *)ownerId;
- (Vehicle *)vehicleWithId:(NSNumber *)vehicleId;
- (void)loadPositionsWithCallback:(void (^)(NSError *error))callback;
- (void)requestRouteForVehicleId:(NSNumber *)vehicleId withCallback:(void(^)(NSArray<Route *> *routes, NSError *error))callback;

@end
