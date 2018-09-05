//
//  OwnerCell.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/5/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Owner.h"

@interface OwnerCell: UITableViewCell

@property (strong, nonatomic) Owner *owner;

+(NSString *)cellID;
+(CGFloat)cellHeight;

@end
