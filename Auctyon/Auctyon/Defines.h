//
//  Defines.h
//  Auktyon
//
//  Created by Anton Chebotov on 14/10/14.
//  Copyright (c) 2014 Anton Chebotov. All rights reserved.
//

#ifndef Auktyon_Defines_h
#define Auktyon_Defines_h


#define LOAD_VIEW_FROM_NIB_NAMED(X) [[[NSBundle mainBundle] loadNibNamed:X owner:self options:nil] objectAtIndex : 0]

#define LS(str) NSLocalizedString(str, nil)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kMainBackgroundColor    UIColorFromRGB(0x303030)
#define kNavigationBarColor     UIColorFromRGB(0x222222)
#define kWhiteColor             [UIColor whiteColor]
#define kRegularTextColor       UIColorFromRGB(0x222222)
#define kCaptionTextColor       [UIColor whiteColor]

#define kRegularTextFontFamily  @"TisaPro-Regular";
#define kCaptionTextFontFamily  @"Open Sans Bold";

#define kRegularTextFontSize    20.f
#define kCaptionTextFontSize    40.f

#endif
