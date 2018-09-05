#import "_Owner.h"

@class OwnerModel;
@interface Owner : _Owner

+ (Owner *)createOwner:(OwnerModel *)ownerModel inContext:(NSManagedObjectContext *)context;

@end
