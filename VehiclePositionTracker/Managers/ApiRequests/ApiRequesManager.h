//
//  ApiRequesManager.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerModel.h"
#import "VehicleModel.h"
#import "PositionModel.h"
#import "Route.h"

@interface ApiRequesManager : NSObject

+ (instancetype)sharedInstance;

- (void)requestAllOwnersWithCallback:(void(^)(NSArray<OwnerModel*> *owners, NSError *error))callback;
- (void)requestVehiclesPositionsForOwnerId:(NSString *)ownerId
                                onCallback:(void (^)(NSArray<PositionModel *> *positions, NSError *error))callback;

- (void)getGooglePathFromLatitude:(float)fromLatitude andLongitude:(float)fromLongitude
                       toLatitude:(float)toLatitude andLongitude:(float)toLongitude
                         callback:(void(^)(NSArray<Route *> *routes, NSError *error))callback;

@end
