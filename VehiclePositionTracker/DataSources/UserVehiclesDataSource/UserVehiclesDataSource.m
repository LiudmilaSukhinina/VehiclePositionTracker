//
//  UserVehiclesDataSource.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "UserVehiclesDataSource.h"
#import <CoreLocation/CoreLocation.h>
#import "DataBaseManager.h"
#import "ApiRequesManager.h"
#import "Owner.h"
#import "Position.h"
#import "Vehicle.h"
#import <MagicalRecord/MagicalRecord.h>

@interface UserVehiclesDataSource()

@property (nonatomic, strong) NSString *selectedVehicleId;
@property (nonatomic, strong) NSNumber *ownerId;
@property (nonatomic, strong) Owner *owner;

@end

@implementation UserVehiclesDataSource

- (void)loadPositionsWithCallback:(void (^)(NSError *error))callback {
    __weak typeof(self) weakSelf = self;
    [[ApiRequesManager sharedInstance]
     requestVehiclesPositionsForOwnerId:[NSString stringWithFormat:@"%@", self.owner.userid]
     onCallback:^(NSArray<PositionModel *> *positions, NSError *error) {
         if (positions) {
             [[DataBaseManager sharedInstance] addVehiclesPositions:positions withCompletion:^(BOOL contextDidSave, NSError *error) {
                 if (callback) {
                     [weakSelf reloadOwner];
                     [weakSelf reloadMarkers];
                     callback(error);
                 }
             }];
         } else {
             if (callback) {
                 callback(error);
             }
         }
     }];
}

- (void)setVehiclesByOwnerId:(NSNumber *)ownerId {
    self.ownerId = ownerId;
    
    [self reloadOwner];
    [self reloadMarkers];
}

- (Vehicle *)vehicleWithId:(NSNumber *)vehicleId {
    NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %@", VehicleAttributes.vehicleId, vehicleId];
    return [[[self.owner.vehicles filteredSetUsingPredicate:findPredicate] allObjects] firstObject];
}

- (void)requestRouteForVehicleId:(NSNumber *)vehicleId withCallback:(void(^)(NSArray<Route *> *routes, NSError *error))callback {
    
    NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %@", VehicleAttributes.vehicleId, vehicleId];
    Position *position = [Vehicle MR_findFirstWithPredicate:findPredicate].position;
    if (position.latitude && position.longitude) {
        CLLocation *location = [[CLLocationManager new] location];
        
        [[ApiRequesManager sharedInstance]
         getGooglePathFromLatitude:location.coordinate.latitude andLongitude:location.coordinate.longitude
         toLatitude:[position.latitude floatValue] andLongitude:[position.longitude floatValue]
         callback:^(NSArray<Route *> *routes, NSError *error) {
             if (callback) {
                 callback(routes, error);
             }
         }];
    }
}

- (void)reloadOwner {
    NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %@", OwnerAttributes.userid, self.ownerId];
    self.owner = [Owner MR_findFirstWithPredicate:findPredicate];
}

- (void)reloadMarkers {
    for (VehicleMapMarker *marker in self.markers) {
        marker.map = nil;
    }
    
    NSMutableArray *markers = [NSMutableArray arrayWithCapacity:self.owner.vehicles.count];
    for (Vehicle *vehicle in self.owner.vehicles) {
        NSNumber *longitude = vehicle.position.longitude;
        NSNumber *latitude = vehicle.position.latitude;
        
        if (longitude && latitude) {
            VehicleMapMarker *marker = [VehicleMapMarker new];
            marker.vehicleId = vehicle.vehicleId;
            marker.position = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
            [markers addObject:marker];
        }
    }
    
    _markers = markers;
}

@end
