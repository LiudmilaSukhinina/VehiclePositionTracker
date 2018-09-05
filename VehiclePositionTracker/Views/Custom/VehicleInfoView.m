//
//  VehicleInfoView.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "VehicleInfoView.h"
#import "Vehicle.h"
#import "UIColor+Additionals.h"
#import <Haneke.h>

@interface VehicleInfoView()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation VehicleInfoView

+ (VehicleInfoView *)viewFromXib {
    return [[[UINib nibWithNibName:NSStringFromClass([VehicleInfoView class]) bundle:NSBundle.mainBundle] instantiateWithOwner:self options:nil] firstObject];
}

- (void)layoutIfNeeded {
    [super layoutIfNeeded];
    
    CGRect newFrame = self.frame;
    newFrame.size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [self setFrame:newFrame];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 5.f;
    self.clipsToBounds = YES;
    
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height / 2;
    self.avatarImageView.clipsToBounds = YES;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self layoutIfNeeded];
}


- (void)setVehicle:(Vehicle *)vehicle {
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", vehicle.make, vehicle.model];
    self.colorView.backgroundColor = [UIColor colorFromHexString:vehicle.color];
    
    NSURL *imageUrl = [NSURL URLWithString:vehicle.foto];
    [self.avatarImageView hnk_setImageFromURL:imageUrl placeholder:[UIImage imageNamed:@"car_icon"]];
}

- (void)setAddress:(NSString *)address {
    self.addressLabel.text = address;
}

@end
