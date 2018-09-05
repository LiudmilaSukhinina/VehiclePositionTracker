#import "_Vehicle.h"

@class VehicleModel;

@interface Vehicle : _Vehicle

+ (Vehicle *)createVehicle:(VehicleModel *)vehicleModel inContext:(NSManagedObjectContext *)context;

@end
