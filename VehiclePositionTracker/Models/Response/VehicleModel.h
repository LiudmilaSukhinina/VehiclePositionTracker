//
//  VehicleModel.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface VehicleModel : BaseModel

@property (assign, nonatomic, readonly) NSInteger vehicleId;
@property (strong, nonatomic, readonly) NSString *color;
@property (strong, nonatomic, readonly) NSString *foto;
@property (strong, nonatomic, readonly) NSString *make;
@property (strong, nonatomic, readonly) NSString *model;
@property (strong, nonatomic, readonly) NSString *vin;
@property (assign, nonatomic, readonly) NSInteger year;

@end
