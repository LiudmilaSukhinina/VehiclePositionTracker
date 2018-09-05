//
//  UsersListDataSource.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Owner;

@interface UsersListDataSource : NSObject

- (void)loadOwnersWithCallback:(void(^)(NSError * _Nullable error))callback;
- (NSInteger)allOwnersCount;
- (Owner * _Nonnull)getOwnerByIndex:(NSInteger)rowIndex;

@end
