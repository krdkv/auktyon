//
//  ASMenuItem.m
//  Auktyon
//
//  Created by Anton Chebotov on 14/10/14.
//  Copyright (c) 2014 Anton Chebotov. All rights reserved.
//

#import "AMMenuItem.h"

@implementation AMMenuItem

- (UINavigationController *) navigationController
{
	if(_navigationController == nil){
		Class class = NSClassFromString(self.mainVCClassName);
		UIViewController * rootVC = [[class alloc] initWithNibName:self.mainVCClassName bundle:nil];
		_navigationController = [[UINavigationController alloc] initWithRootViewController:rootVC];
		_navigationController.navigationBarHidden = YES;
		_navigationController.view.backgroundColor = [UIColor redColor];
	}
	return _navigationController;
}

@end
