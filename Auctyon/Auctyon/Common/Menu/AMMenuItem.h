//
//  AMMenuItem.h
//  Auktyon
//
//  Created by Anton Chebotov on 14/10/14.
//  Copyright (c) 2014 Anton Chebotov. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface AMMenuItem : NSObject

@property (strong, nonatomic) UINavigationController * navigationController;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageName;
@property (assign, nonatomic) NSString * mainVCClassName;
@property (assign, nonatomic) Class accessoryViewControllerClass;

@end
