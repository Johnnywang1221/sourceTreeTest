//
//  WishCreditCardUtil.h
//  Wish
//
//  Created by Christopher Fayoux on 7/16/13.
//  Copyright (c) 2013 ContextLogic. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    WishCreditCardTypeUnknown,
    WishCreditCardTypeInvalid,
    WishCreditCardTypeVisa,
    WishCreditCardTypeMasterCard,
    WishCreditCardTypeAmex,
    WishCreditCardTypeDiscover,
    WishCreditCardTypeHiperCard,
    WishCreditCardTypeDinersClub
} WishCreditCardType;

@interface WishCreditCardUtil : NSObject

+ (NSString *)sanitizeNumber:(NSString *)number;
+ (WishCreditCardType)getCreditCardType:(NSString *)number;
+ (NSUInteger)getCardNumberLengthForType:(WishCreditCardType)cardType;
+ (BOOL)isValidNumber:(NSString *)number forType:(WishCreditCardType)type;
+ (BOOL)hasValidCheckSumForNumber:(NSString *)number;
+ (NSString *)formatNumber:(NSString *)number forType:(WishCreditCardType)type;
+ (NSUInteger)getSecurityCodeLengthForType:(WishCreditCardType)type;
+ (NSInteger)getFirstGroupLength;
+ (NSString *)getFormattedExpiryDateFor:(NSInteger)month year:(NSInteger)year;

@end
