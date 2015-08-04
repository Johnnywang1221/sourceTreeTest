//
//  WishAddressUtil.h
//  Wish
//
//  Created by Christopher Fayoux on 7/15/13.
//  Copyright (c) 2013 ContextLogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WishAddressUtil : NSObject

+ (NSDictionary *)getStateMap;
+ (NSDictionary *)getCountryMap;
+ (NSString *)getSubdivisionNameForCountry:(NSString *)countryCode;

@end
