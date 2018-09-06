//
//  UIAlertController+Errors.h
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/6/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Errors)

+(void)showAlertInController:(UIViewController *)vc
                   withTitle:(NSString *)title
                     message:(NSString *)message
                 cancelTitle:(NSString *)cancelTitle
                  completion:(void(^)(void))completion;

@end
