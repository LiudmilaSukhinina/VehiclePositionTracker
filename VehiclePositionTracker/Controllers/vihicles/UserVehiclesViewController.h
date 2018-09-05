//
//  UserVehiclesViewController.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/4/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserVehiclesDataSource.h"

@interface UserVehiclesViewController : UIViewController

- (void)setVehiclesByOwnerId:(NSNumber *)ownerId dataSource:(UserVehiclesDataSource *)vehicleDataSource;

@end
