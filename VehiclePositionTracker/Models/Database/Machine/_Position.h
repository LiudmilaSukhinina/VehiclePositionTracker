// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Position.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Vehicle;

@interface PositionID : NSManagedObjectID {}
@end

@interface _Position : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PositionID *objectID;

@property (nonatomic, strong, nullable) NSNumber* latitude;

@property (atomic) float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

@property (nonatomic, strong, nullable) NSNumber* longitude;

@property (atomic) float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

@property (nonatomic, strong, nullable) Vehicle *vehicle;

@end

@interface _Position (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(nullable NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;

- (nullable NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(nullable NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;

- (Vehicle*)primitiveVehicle;
- (void)setPrimitiveVehicle:(Vehicle*)value;

@end

@interface PositionAttributes: NSObject 
+ (NSString *)latitude;
+ (NSString *)longitude;
@end

@interface PositionRelationships: NSObject
+ (NSString *)vehicle;
@end

NS_ASSUME_NONNULL_END
