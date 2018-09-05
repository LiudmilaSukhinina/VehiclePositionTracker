//
//  UsersListDataSource.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "UsersListDataSource.h"
#import "ApiRequesManager.h"
#import "DataBaseManager.h"
#import "Owner.h"
#import <MagicalRecord/MagicalRecord.h>

@interface UsersListDataSource()

@property (nonatomic, strong) NSArray<Owner *> *owners;

@end

@implementation UsersListDataSource

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self loadAllOwners];
    }
    
    return self;
}

- (void)loadAllOwners {
    self.owners = [Owner MR_findAll];
}

- (NSInteger)allOwnersCount {
    return [self.owners count];
}

- (Owner *)getOwnerByIndex:(NSInteger)rowIndex {
    return self.owners[rowIndex];
}

- (void)loadOwnersWithCallback:(void (^)(NSError * _Nullable))callback {
    __weak typeof(self) weakSelf = self;
    [[ApiRequesManager sharedInstance] requestAllOwnersWithCallback:^(NSArray<OwnerModel *> *owners, NSError *error) {
        if (owners) {
            [[DataBaseManager sharedInstance] addOwners:owners withCompletion:^(BOOL contextDidSave, NSError *error) {
                if (callback) {
                    [weakSelf loadAllOwners];
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


@end
