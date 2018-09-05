#import "Position.h"

#import "PositionModel.h"

@interface Position ()

// Private interface goes here.

@end

@implementation Position

- (void)update:(PositionModel *)positionModel {
    self.latitude = [NSNumber numberWithDouble: positionModel.latitude];
    self.longitude = [NSNumber numberWithDouble: positionModel.longitude];
}

@end
