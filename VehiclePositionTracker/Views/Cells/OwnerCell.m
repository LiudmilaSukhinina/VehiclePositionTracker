//
//  OwnerCell.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "OwnerCell.h"
#import <Haneke.h>

@interface OwnerCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end

@implementation OwnerCell

+(NSString *)cellID {
    return @"OWNER_CELL_ID";
}

+(CGFloat)cellHeight {
    return 60;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.size.width / 2;
    self.imgAvatar.clipsToBounds = YES;
}

- (void)setOwner:(Owner *)owner {
    self.lblName.text = [NSString stringWithFormat:@"%@ %@", owner.name, owner.surname];
    NSURL *avatarUrl = [NSURL URLWithString:owner.foto];
    [self.imgAvatar hnk_setImageFromURL:avatarUrl placeholder:[UIImage imageNamed:@"no_avatar"]];
}

@end
