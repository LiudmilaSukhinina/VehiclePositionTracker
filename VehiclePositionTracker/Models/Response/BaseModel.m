//
//  BaseModel.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (dictionary == nil) {
        return nil;
    }
    
    return [super init];
}


@end
