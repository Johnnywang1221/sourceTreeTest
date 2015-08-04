//
//  WishPlatformUtil.m
//  Wish
//
//  Created by Tarek Fahmy on 8/26/13.
//  Copyright (c) 2013 ContextLogic. All rights reserved.
//

#import "WishPlatformUtil.h"
#import <AdSupport/ASIdentifierManager.h>

@implementation WishPlatformUtil

+ (BOOL)advertisingTrackingAllowed
{
    if ([ASIdentifierManager class]) {
        ASIdentifierManager *manager = [ASIdentifierManager sharedManager];
        return [manager isAdvertisingTrackingEnabled];
    } else {
        return true;
    }
}

@end
