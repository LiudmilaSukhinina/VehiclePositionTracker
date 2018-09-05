//
//  VehicleInfoView.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vehicle, VehicleInfoView;

@interface VehicleInfoView : UIView

+ (VehicleInfoView *)viewFromXib;

- (void)setAddress:(NSString *)address;
- (void)setVehicle:(Vehicle *)vehicle;

@end
