#import "Vehicle.h"
#import "VehicleModel.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Position.h"

@interface Vehicle ()

// Private interface goes here.

@end

@implementation Vehicle

+ (Vehicle *)createVehicle:(VehicleModel *)vehicleModel inContext:(NSManagedObjectContext *)context {
    NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %d", VehicleAttributes.vehicleId, vehicleModel.vehicleId];
    
    Vehicle *vehicle = [Vehicle MR_findFirstWithPredicate:findPredicate inContext:context];
    if (vehicle == nil) {
        vehicle = [Vehicle MR_createEntityInContext:context];
        vehicle.vehicleId = [NSNumber numberWithInteger:vehicleModel.vehicleId];
        vehicle.position = [Position MR_createEntityInContext:context];
    }
    
    [vehicle update:vehicleModel];
    
    return vehicle;
}

- (void)update:(VehicleModel *)vehicleModel {
    self.foto = vehicleModel.foto;
    self.make = vehicleModel.make;
    self.model = vehicleModel.model;
    self.vin = vehicleModel.vin;
    self.color = vehicleModel.color;
    self.year = [NSNumber numberWithInteger:vehicleModel.year];
}

@end
