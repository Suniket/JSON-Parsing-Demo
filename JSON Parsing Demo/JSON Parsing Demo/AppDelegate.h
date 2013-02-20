//
//  AppDelegate.h
//  JSON Parsing Demo
//
//  Created by Suniket Wagh on 06/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray* mainArray;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic)NSArray* mainArray;
@end
