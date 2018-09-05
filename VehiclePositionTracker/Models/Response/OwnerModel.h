//
//  OwnerModel.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//


#import "BaseModel.h"

@class VehicleModel;

@interface OwnerModel : BaseModel

@property (assign, nonatomic, readonly) NSInteger userId;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *surname;
@property (strong, nonatomic, readonly) NSString *foto;
@property (strong, nonatomic, readonly) NSArray<VehicleModel *> *vehicles;

@end
