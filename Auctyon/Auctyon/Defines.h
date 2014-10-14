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


#endif
