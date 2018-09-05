#import "Owner.h"
#import "OwnerModel.h"
#import <MagicalRecord/MagicalRecord.h>

@interface Owner ()

// Private interface goes here.

@end

@implementation Owner

+ (Owner *)createOwner:(OwnerModel *)ownerModel inContext:(NSManagedObjectContext *)context {
    NSPredicate *findPredicate = [NSPredicate predicateWithFormat:@"%K == %d", OwnerAttributes.userid, ownerModel.userId];
    
    Owner *owner = [Owner MR_findFirstWithPredicate:findPredicate inContext:context];
    if (owner == nil) {
        owner = [Owner MR_createEntityInContext:context];
        owner.userid = [NSNumber numberWithInteger:ownerModel.userId];
    }
    
    [owner update:ownerModel];
    
    return owner;
}

- (void)update:(OwnerModel *)owner {
    self.name = owner.name;
    self.surname = owner.surname;
    self.foto = owner.foto;
}

@end
