//
//  UIAlertController+Errors.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/6/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "UIAlertController+Errors.h"

@implementation UIAlertController (Errors)

+ (void)showAlertInController:(UIViewController *)vc
                       withTitle:(NSString *)title
                         message:(NSString *)message
                     cancelTitle:(NSString *)cancelTitle
                      completion:(void(^)(void))completion {
     dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:[cancelTitle ?: @"ok" capitalizedString]
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (completion) {
                                                               completion();
                                                           }
                                                       }];
        [alert addAction:action];
        
        if (vc && [vc isKindOfClass:[UIViewController class]]) {
            [vc presentViewController:alert animated:YES completion:nil];
        } else {
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }
    });
}

@end
