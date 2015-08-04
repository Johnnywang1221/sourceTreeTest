//
//  WishLocaleUtil.m
//  Wish
//
//  Created by Michael Ahn on 4/28/15.
//  Copyright (c) 2015 ContextLogic. All rights reserved.
//

#import "WishLocaleUtil.h"

@implementation WishLocaleUtil

+ (BOOL)deviceLocaleStartsWith:(NSString *)localePrefix
{
    return [[[NSLocale preferredLanguages] objectAtIndex:0] hasPrefix:localePrefix];
}

+ (BOOL)deviceLocaleIsEnglish
{
    return [self deviceLocaleStartsWith:@"en"];
}

@end
