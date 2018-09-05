//
//  Route.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (readonly, strong, nonatomic) NSString *googleRouteString;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithGoogleRouteString:(NSString *)googleRouteString;

@end
