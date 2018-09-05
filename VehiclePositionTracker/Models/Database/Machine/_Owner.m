// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Owner.m instead.

#import "_Owner.h"

@implementation OwnerID
@end

@implementation _Owner

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Owner" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Owner";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Owner" inManagedObjectContext:moc_];
}

- (OwnerID*)objectID {
	return (OwnerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"useridValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic foto;

@dynamic name;

@dynamic surname;

@dynamic userid;

- (int32_t)useridValue {
	NSNumber *result = [self userid];
	return [result intValue];
}

- (void)setUseridValue:(int32_t)value_ {
	[self setUserid:@(value_)];
}

- (int32_t)primitiveUseridValue {
	NSNumber *result = [self primitiveUserid];
	return [result intValue];
}

- (void)setPrimitiveUseridValue:(int32_t)value_ {
	[self setPrimitiveUserid:@(value_)];
}

@dynamic vehicles;

- (NSMutableSet<Vehicle*>*)vehiclesSet {
	[self willAccessValueForKey:@"vehicles"];

	NSMutableSet<Vehicle*> *result = (NSMutableSet<Vehicle*>*)[self mutableSetValueForKey:@"vehicles"];

	[self didAccessValueForKey:@"vehicles"];
	return result;
}

@end

@implementation OwnerAttributes 
+ (NSString *)foto {
	return @"foto";
}
+ (NSString *)name {
	return @"name";
}
+ (NSString *)surname {
	return @"surname";
}
+ (NSString *)userid {
	return @"userid";
}
@end

@implementation OwnerRelationships 
+ (NSString *)vehicles {
	return @"vehicles";
}
@end

