// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Vehicle.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Owner;
@class Position;

@interface VehicleID : NSManagedObjectID {}
@end

@interface _Vehicle : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VehicleID *objectID;

@property (nonatomic, strong, nullable) NSString* color;

@property (nonatomic, strong, nullable) NSString* foto;

@property (nonatomic, strong, nullable) NSString* make;

@property (nonatomic, strong, nullable) NSString* model;

@property (nonatomic, strong, nullable) NSNumber* vehicleId;

@property (atomic) int32_t vehicleIdValue;
- (int32_t)vehicleIdValue;
- (void)setVehicleIdValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSString* vin;

@property (nonatomic, strong, nullable) NSNumber* year;

@property (atomic) int32_t yearValue;
- (int32_t)yearValue;
- (void)setYearValue:(int32_t)value_;

@property (nonatomic, strong, nullable) Owner *owner;

@property (nonatomic, strong, nullable) Position *position;

@end

@interface _Vehicle (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSString*)primitiveColor;
- (void)setPrimitiveColor:(nullable NSString*)value;

- (nullable NSString*)primitiveFoto;
- (void)setPrimitiveFoto:(nullable NSString*)value;

- (nullable NSString*)primitiveMake;
- (void)setPrimitiveMake:(nullable NSString*)value;

- (nullable NSString*)primitiveModel;
- (void)setPrimitiveModel:(nullable NSString*)value;

- (nullable NSNumber*)primitiveVehicleId;
- (void)setPrimitiveVehicleId:(nullable NSNumber*)value;

- (int32_t)primitiveVehicleIdValue;
- (void)setPrimitiveVehicleIdValue:(int32_t)value_;

- (nullable NSString*)primitiveVin;
- (void)setPrimitiveVin:(nullable NSString*)value;

- (nullable NSNumber*)primitiveYear;
- (void)setPrimitiveYear:(nullable NSNumber*)value;

- (int32_t)primitiveYearValue;
- (void)setPrimitiveYearValue:(int32_t)value_;

- (Owner*)primitiveOwner;
- (void)setPrimitiveOwner:(Owner*)value;

- (Position*)primitivePosition;
- (void)setPrimitivePosition:(Position*)value;

@end

@interface VehicleAttributes: NSObject 
+ (NSString *)color;
+ (NSString *)foto;
+ (NSString *)make;
+ (NSString *)model;
+ (NSString *)vehicleId;
+ (NSString *)vin;
+ (NSString *)year;
@end

@interface VehicleRelationships: NSObject
+ (NSString *)owner;
+ (NSString *)position;
@end

NS_ASSUME_NONNULL_END
