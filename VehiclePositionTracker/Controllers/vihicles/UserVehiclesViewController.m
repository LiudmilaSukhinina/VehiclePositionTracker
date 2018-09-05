//
//  UserVehiclesViewController.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/4/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "UserVehiclesViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "UserVehiclesDataSource.h"
#import "VehicleMapMarker.h"
#import "VehicleInfoView.h"
#import "Route.h"

const NSTimeInterval kUpdateMapTimeSec = 60;

@interface UserVehiclesViewController () <GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView *vwMap;
@property (nonatomic, weak) GMSPolyline *currentPath;

@property (nonatomic, weak) NSTimer *updateMapTimer;
@property (nonatomic, strong) UserVehiclesDataSource *dataSource;
@property (nonatomic, strong) NSPointerArray *markersPointersArray;

@end

@implementation UserVehiclesViewController

//- (void)loadView {
//    [super loadView];
//    //self.dataSource = [UserVehiclesDataSource new];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vwMap.delegate = self;
    [self setupMap];
    [self updateMarkers];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.vwMap layoutIfNeeded];
}

- (void)setVehiclesByOwnerId:(NSNumber *)ownerId dataSource:(UserVehiclesDataSource *)vehicleDataSource{
    self.dataSource = vehicleDataSource;
    [self.dataSource setVehiclesByOwnerId:ownerId];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:false];
    
    self.updateMapTimer = [NSTimer scheduledTimerWithTimeInterval:kUpdateMapTimeSec target:self selector:@selector(updateMapData:) userInfo:nil repeats:YES];
    [self.updateMapTimer fire];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:true];
    [self.updateMapTimer invalidate];
}

- (void)setupMap {
    self.vwMap.myLocationEnabled = YES;
    self.vwMap.settings.myLocationButton = YES;
}

- (void)updateMapData:(NSTimer *)sender {
    [self updateMarkers];
}

#pragma mark - GMSMapViewDelegate

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(VehicleMapMarker *)marker {
    if (mapView.selectedMarker == marker) {
        mapView.selectedMarker = nil;
    } else {
        GMSCameraPosition *cameraPosition = [GMSCameraPosition cameraWithLatitude:marker.position.latitude longitude:marker.position.longitude zoom:15.f];
        [mapView animateToCameraPosition:cameraPosition];
        
        __weak typeof(self) weakSelf = self;
        [self.dataSource requestRouteForVehicleId:marker.vehicleId withCallback:^(NSArray<Route *> *routes, NSError *error) {
            GMSPolyline *polyline = [weakSelf polylineFromRoutes:routes];
            polyline.map = weakSelf.vwMap;
        }];
        
        mapView.selectedMarker = marker;
    }
    
    return YES;
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(VehicleMapMarker *)marker {
    Vehicle *vehicle = [self.dataSource vehicleWithId:marker.vehicleId];
    if (vehicle) {
        VehicleInfoView *view = [VehicleInfoView viewFromXib];
        [view setVehicle:vehicle];
        [[GMSGeocoder geocoder] reverseGeocodeCoordinate:marker.position completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error) {
            if (view != nil) {
                GMSAddress *address = response.firstResult;
                if (address.locality != nil && address.thoroughfare != nil) {
                    NSString *addressString = [NSString stringWithFormat:@"%@, %@", address.locality, address.thoroughfare];
                    [view setAddress:addressString];
                }
                [view layoutIfNeeded];
            }
        }];
        
        return view;
    }
    
    return nil;
}

- (GMSPolyline *)polylineFromRoutes:(NSArray<Route *> *)routes {
    GMSMutablePath *path = [GMSMutablePath path];
    for (Route *route in routes) {
        GMSPath *polylinePath = [GMSPath pathFromEncodedPath:route.googleRouteString];
        for (int i = 0; i < polylinePath.count; i++) {
            [path addCoordinate:[polylinePath coordinateAtIndex:i]];
        }
    }
    
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeWidth = 5.f;
    polyline.strokeColor = UIColor.greenColor;
    
    return polyline;
}

- (void)mapView:(GMSMapView *)mapView didCloseInfoWindowOfMarker:(GMSMarker *)marker {
    self.currentPath.map = nil;
}

- (void)presentInfoAlertControllerWithTitle:(NSString *)title {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:NO completion:nil];
}

- (void)updateMarkers {
    __weak typeof(self) weakSelf = self;
    [self.dataSource loadPositionsWithCallback:^(NSError *error) {
        if (error == nil) {
            for (VehicleMapMarker *marker in weakSelf.dataSource.markers) {
                UIImageView *markerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
                markerImageView.image = [UIImage imageNamed:@"car_icon"];
                markerImageView.contentMode = UIViewContentModeScaleAspectFit;
                marker.iconView = markerImageView;
                
                marker.infoWindowAnchor = CGPointMake(0.44f, 0.2f);
                marker.map = weakSelf.vwMap;
            }
        }
    }];
}


@end
