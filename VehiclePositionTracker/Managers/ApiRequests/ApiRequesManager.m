//
//  ApiRequesManager.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "ApiRequesManager.h"
#import <AFNetworking/AFNetworking.h>


#define BASE_URL @"http://mobi.connectedcar360.net/api"
#define GOOGLE_API_KEY @"AIzaSyAORSeD6yCrPUIAw3ID66k_mnIL2j26doU"
#define GOOGLE_DIRECTION_URL    @"https://maps.googleapis.com/maps/api/directions/json"

@implementation ApiRequesManager

+ (instancetype)sharedInstance
{
    static ApiRequesManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ApiRequesManager new];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureManager];
    }
    return self;
}

- (void)configureManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}

- (void)requestAllOwnersWithCallback:(void (^)(NSArray <OwnerModel *> *owners, NSError *error))callback {
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"list", @"op", nil];
    
    [[AFHTTPSessionManager manager] GET:BASE_URL
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if (responseObject) {
                                        NSMutableArray *owners = [NSMutableArray new];
                                        for (NSDictionary *disctionary in responseObject[@"data"]) {
                                            OwnerModel *responseOwner = [[OwnerModel alloc] initWithDictionary:disctionary];
                                            
                                            if (responseOwner) {
                                                [owners addObject:responseOwner];
                                            }
                                        }
                                        callback(owners, nil);
                                    }
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (callback) {
                                        callback(nil, error);
                                    }
                                }];
}

- (void)requestVehiclesPositionsForOwnerId:(NSString *)ownerId onCallback:(void (^)(NSArray<PositionModel *> *, NSError *))callback {
    
   NSDictionary *params =  [NSDictionary dictionaryWithObjectsAndKeys:
                            @"getlocations", @"op",
                            ownerId, @"userid", nil];
    
    [[AFHTTPSessionManager manager] GET:BASE_URL
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if (callback && responseObject) {
                                        NSMutableArray *vehicles = [NSMutableArray new];
                                        for (NSDictionary *responseDictionary in responseObject[@"data"]) {
                                            PositionModel *responsePosition = [[PositionModel alloc] initWithDictionary:responseDictionary];
                                            
                                            if (responsePosition) {
                                                [vehicles addObject:responsePosition];
                                            }
                                        }
                                        
                                        callback(vehicles, nil);
                                    }
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (callback) {
                                        callback(nil, error);
                                    }
                                }];
}

- (void)getGooglePathFromLatitude:(float)fromLatitude andLongitude:(float)fromLongitude
                       toLatitude:(float)toLatitude andLongitude:(float)toLongitude
                         callback:(void(^)(NSArray<Route *> *routes, NSError *error))callback {
    
    NSDictionary *params = @{@"origin"      : [NSString stringWithFormat:@"%f,%f", fromLatitude, fromLongitude],
                             @"destination" : [NSString stringWithFormat:@"%f,%f", toLatitude, toLongitude],
                             @"sensor"      : @"false",
                             @"key"         : GOOGLE_API_KEY };
    
    [[AFHTTPSessionManager manager] GET:GOOGLE_DIRECTION_URL
                             parameters:params
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    if (callback && [responseObject isKindOfClass:[NSDictionary class]]) {
                                        NSDictionary *response = responseObject;
                                        NSDictionary *route = [response[@"routes"] firstObject];
                                        if (route) {
                                            NSDictionary *legs = [route[@"legs"] firstObject];
                                            if (legs) {
                                                NSMutableArray<Route *> *routesArray = [NSMutableArray new];
                                                NSArray<NSDictionary *> *steps = legs[@"steps"] ;
                                                for (NSDictionary *step in steps) {
                                                    NSString *googleRouteString = [step[@"polyline"] objectForKey:@"points"];
                                                    Route *route = [[Route alloc] initWithGoogleRouteString:googleRouteString];
                                                    [routesArray addObject:route];
                                                }
                                                
                                                callback(routesArray, nil);
                                            }
                                        }
                                    }
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (callback) {
                                        callback(nil, error);
                                    }
                                }];
}


@end
