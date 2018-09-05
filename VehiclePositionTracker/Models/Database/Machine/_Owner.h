// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Owner.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Vehicle;

@interface OwnerID : NSManagedObjectID {}
@end

@interface _Owner : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) OwnerID *objectID;

@property (nonatomic, strong, nullable) NSString* foto;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic, strong, nullable) NSString* surname;

@property (nonatomic, strong, nullable) NSNumber* userid;

@property (atomic) int32_t useridValue;
- (int32_t)useridValue;
- (void)setUseridValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSSet<Vehicle*> *vehicles;
- (nullable NSMutableSet<Vehicle*>*)vehiclesSet;

@end

@interface _Owner (VehiclesCoreDataGeneratedAccessors)
- (void)addVehicles:(NSSet<Vehicle*>*)value_;
- (void)removeVehicles:(NSSet<Vehicle*>*)value_;
- (void)addVehiclesObject:(Vehicle*)value_;
- (void)removeVehiclesObject:(Vehicle*)value_;

@end

@interface _Owner (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveFoto;
- (void)setPrimitiveFoto:(nullable NSString*)value;

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

- (nullable NSString*)primitiveSurname;
- (void)setPrimitiveSurname:(nullable NSString*)value;

- (nullable NSNumber*)primitiveUserid;
- (void)setPrimitiveUserid:(nullable NSNumber*)value;

- (int32_t)primitiveUseridValue;
- (void)setPrimitiveUseridValue:(int32_t)value_;

- (NSMutableSet<Vehicle*>*)primitiveVehicles;
- (void)setPrimitiveVehicles:(NSMutableSet<Vehicle*>*)value;

@end

@interface OwnerAttributes: NSObject 
+ (NSString *)foto;
+ (NSString *)name;
+ (NSString *)surname;
+ (NSString *)userid;
@end

@interface OwnerRelationships: NSObject
+ (NSString *)vehicles;
@end

NS_ASSUME_NONNULL_END
