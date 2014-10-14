//
//  ASMenuCell.m
//  aviasales
//
//  Created by Ruslan Shevchuk on 06/03/2013.
//
//

#import "AMMenuCell.h"

#define kAMMenuCellNormalAlpha 0.75

@interface AMMenuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@end

@implementation AMMenuCell



- (void)setupWithItem:(AMMenuItem *)item
{
	[self setBackgroundColor:nil];
    
	self.item = item;
    
	UIImage *itemImage = [UIImage imageNamed:self.item.imageName];
	self.itemImageView.image = itemImage;
    
		self.itemLabel.text = [self.item.name uppercaseString];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
	[super setHighlighted:highlighted animated:animated];
	[self updateHighlight];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];
	[self updateHighlight];
}

- (void)updateHighlight
{
	BOOL highlighted = self.highlighted || self.selected;
	
	self.itemImageView.alpha = highlighted ? 1 : kAMMenuCellNormalAlpha;
	NSString *fontName = highlighted ? @"HelveticaNeue-Bold" : @"HelveticaNeue";
	[self.itemLabel setFont:[UIFont fontWithName:fontName size:9]];
	
	self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
	self.layer.shadowOffset = CGSizeMake(0, 1);
	self.layer.shadowOpacity = highlighted ? 0.5 : 0;
	self.layer.shouldRasterize = highlighted ? YES : NO;
	self.layer.shadowRadius = 2;
}

@end
