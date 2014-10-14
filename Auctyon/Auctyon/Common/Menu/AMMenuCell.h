//
//  ASMenuCell.h
//  aviasales
//
//  Created by Ruslan Shevchuk on 06/03/2013.
//
//

#import <UIKit/UIKit.h>
#import "AMMenuItem.h"

@interface AMMenuCell : UITableViewCell

@property (weak, nonatomic) AMMenuItem *item;

- (void)setupWithItem:(AMMenuItem *)item;

@end
