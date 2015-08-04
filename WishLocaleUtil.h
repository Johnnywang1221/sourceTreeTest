//
//  WishLocaleUtil.h
//  Wish
//
//  Created by Michael Ahn on 4/28/15.
//  Copyright (c) 2015 ContextLogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WishLocaleUtil : NSObject

+ (BOOL)deviceLocaleStartsWith:(NSString *)localePrefix;

+ (BOOL)deviceLocaleIsEnglish;

@end
