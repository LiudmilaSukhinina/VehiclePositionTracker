//
//  PositionModel.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface PositionModel : BaseModel

@property (nonatomic, strong) NSNumber *vehicleId;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@end
