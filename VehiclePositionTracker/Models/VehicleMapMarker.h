//
//  VehicleMapMarker.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>

@interface VehicleMapMarker : GMSMarker

@property (nonatomic, strong) NSNumber *vehicleId;

@end
