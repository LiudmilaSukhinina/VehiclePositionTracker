// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Vehicle.m instead.

#import "_Vehicle.h"

@implementation VehicleID
@end

@implementation _Vehicle

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Vehicle" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Vehicle";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Vehicle" inManagedObjectContext:moc_];
}

- (VehicleID*)objectID {
	return (VehicleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"vehicleIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"vehicleId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"yearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"year"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic color;

@dynamic foto;

@dynamic make;

@dynamic model;

@dynamic vehicleId;

- (int32_t)vehicleIdValue {
	NSNumber *result = [self vehicleId];
	return [result intValue];
}

- (void)setVehicleIdValue:(int32_t)value_ {
	[self setVehicleId:@(value_)];
}

- (int32_t)primitiveVehicleIdValue {
	NSNumber *result = [self primitiveVehicleId];
	return [result intValue];
}

- (void)setPrimitiveVehicleIdValue:(int32_t)value_ {
	[self setPrimitiveVehicleId:@(value_)];
}

@dynamic vin;

@dynamic year;

- (int32_t)yearValue {
	NSNumber *result = [self year];
	return [result intValue];
}

- (void)setYearValue:(int32_t)value_ {
	[self setYear:@(value_)];
}

- (int32_t)primitiveYearValue {
	NSNumber *result = [self primitiveYear];
	return [result intValue];
}

- (void)setPrimitiveYearValue:(int32_t)value_ {
	[self setPrimitiveYear:@(value_)];
}

@dynamic owner;

@dynamic position;

@end

@implementation VehicleAttributes 
+ (NSString *)color {
	return @"color";
}
+ (NSString *)foto {
	return @"foto";
}
+ (NSString *)make {
	return @"make";
}
+ (NSString *)model {
	return @"model";
}
+ (NSString *)vehicleId {
	return @"vehicleId";
}
+ (NSString *)vin {
	return @"vin";
}
+ (NSString *)year {
	return @"year";
}
@end

@implementation VehicleRelationships 
+ (NSString *)owner {
	return @"owner";
}
+ (NSString *)position {
	return @"position";
}
@end

