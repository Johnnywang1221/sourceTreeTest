//
//  WishCreditCardUtil.m
//  Wish
//
//  Created by Christopher Fayoux on 7/16/13.
//  Copyright (c) 2013 ContextLogic. All rights reserved.
//

#import "WishCreditCardUtil.h"

#define FIRST_GROUP_LENGTH 4

#define REGEX_AMEX_TYPE @"^3[47][0-9]{2}$"
#define REGEX_VISA_TYPE @"^4[0-9]{3}?"
#define REGEX_MASTERCARD_TYPE @"^5[1-5][0-9]{2}$"
#define REGEX_HIPERCARD_TYPE @"^(6[0-9]{3}|3841)$"
#define REGEX_DISCOVER_TYPE @"^6(?:011|5[0-9]{2})$"
#define REGEX_DINERS_CLUB_TYPE @"^3(?:0[0-5]|[68][0-9])[0-9]$"

@implementation WishCreditCardUtil

+ (NSString *)sanitizeNumber:(NSString *)number
{
    NSArray *array = [number componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [array componentsJoinedByString:@""];
}

+ (NSUInteger)getCardNumberLengthForType:(WishCreditCardType)cardType
{
    switch (cardType) {
        case WishCreditCardTypeVisa:
        case WishCreditCardTypeDiscover:
        case WishCreditCardTypeMasterCard:
            return 16;
            break;
        case WishCreditCardTypeHiperCard:
            return 19;
        case WishCreditCardTypeAmex:
            return 15;
        case WishCreditCardTypeDinersClub:
            return 14;
        default:
            return NSUIntegerMax;
            break;
    }
}

+ (WishCreditCardType)getCreditCardType:(NSString *)number
{
    if ([number length] < FIRST_GROUP_LENGTH) {
        return WishCreditCardTypeUnknown;
    }
    number = [number substringToIndex:FIRST_GROUP_LENGTH];
    NSRange range = NSMakeRange(0, [number length]);
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:REGEX_VISA_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeVisa;
    }

    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_AMEX_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeAmex;
    }

    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_MASTERCARD_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeMasterCard;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_DISCOVER_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeDiscover;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_HIPERCARD_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeHiperCard;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_DINERS_CLUB_TYPE options:0 error:nil];
    if ([[exp matchesInString:number options:0 range:range] count] > 0) {
        return WishCreditCardTypeDinersClub;
    }

    return WishCreditCardTypeInvalid;
}

+ (BOOL)isValidNumber:(NSString *)number forType:(WishCreditCardType)type
{
    number = [WishCreditCardUtil sanitizeNumber:number];
    
    NSString *regex;
    switch (type) {
        case WishCreditCardTypeVisa:
            regex = REGEX_VISA_TYPE;
            break;
        case WishCreditCardTypeAmex:
            regex = REGEX_AMEX_TYPE;
            break;
        case WishCreditCardTypeDiscover:
            regex = REGEX_DISCOVER_TYPE;
            break;
        case WishCreditCardTypeMasterCard:
            regex = REGEX_MASTERCARD_TYPE;
            break;
        case WishCreditCardTypeDinersClub:
            regex = REGEX_DINERS_CLUB_TYPE;
            break;
        case WishCreditCardTypeHiperCard:
            regex = REGEX_HIPERCARD_TYPE;
            break;
        default:
            regex = nil;
            break;
    }

    if (regex == nil) {
        return false;
    }
    
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    if (type == WishCreditCardTypeHiperCard) {
        return ([[exp matchesInString:number options:0 range:NSMakeRange(0, [WishCreditCardUtil getFirstGroupLength])] count] > 0) && ([number length] == 16 || [number length] == 19);
    } else if ([self hasValidCheckSumForNumber:number] && [[exp matchesInString:number options:0 range:NSMakeRange(0, [WishCreditCardUtil getFirstGroupLength])] count] > 0) {
        return true;
    } else {
        return false;
    }
}

+ (BOOL)hasValidCheckSumForNumber:(NSString *)number
{
    @try {
        NSInteger sum = 0;
        BOOL doubled = false;
        
        for (NSInteger i = [number length] - 1; i >= 0; i--) {
            NSInteger digit = [[number substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger valueToAdd = 0;
            if (doubled) {
                valueToAdd = digit * 2;
                if (valueToAdd > 9) {
                    valueToAdd -= 9;
                }
            } else {
                valueToAdd = digit;
            }
            sum += valueToAdd;
            doubled = !doubled;
        }
        
        return ((sum % 10) == 0);
    }
    @catch (NSException *e) {
        return false;
    }
}

+ (NSString *)formatNumber:(NSString *)number forType:(WishCreditCardType)type
{
    NSArray *spaceIndicies;
    switch (type) {
        case WishCreditCardTypeVisa:
        case WishCreditCardTypeDiscover:
        case WishCreditCardTypeMasterCard:
        case WishCreditCardTypeDinersClub:
        case WishCreditCardTypeHiperCard:
            spaceIndicies = [NSArray arrayWithObjects:[NSNumber numberWithInteger:4], [NSNumber numberWithInteger:9], [NSNumber numberWithInteger:14], nil];
            break;
        case WishCreditCardTypeAmex:
            spaceIndicies = [NSArray arrayWithObjects:[NSNumber numberWithInteger:4], [NSNumber numberWithInteger:11], nil];
            break;
        default:
            spaceIndicies = nil;
            break;
    }
    
    NSMutableString *mutableNumber = [[NSMutableString alloc] initWithString:number];
    for (NSNumber *number in spaceIndicies) {
        NSInteger index = [number integerValue];
        if (index == [mutableNumber length]) {
            [mutableNumber appendString:@" "];
        } else if (index < [mutableNumber length]){
            [mutableNumber insertString:@" " atIndex:index];
        }
    }
    
    return mutableNumber;
}

+ (NSUInteger)getSecurityCodeLengthForType:(WishCreditCardType)type
{
    switch(type) {
        case WishCreditCardTypeMasterCard:
        case WishCreditCardTypeVisa:
        case WishCreditCardTypeDiscover:
        case WishCreditCardTypeDinersClub:
        case WishCreditCardTypeHiperCard:
            return 3;
            break;
        case WishCreditCardTypeAmex:
        default:
            return 4;
            break;
    }
}

+ (NSInteger)getFirstGroupLength
{
    return FIRST_GROUP_LENGTH;
}

+ (NSString *)getFormattedExpiryDateFor:(NSInteger)month year:(NSInteger)year
{
    NSString *monthString;
    if (month <= 9) {
        monthString = [NSString stringWithFormat:@"0%ld", (long)month];
    } else {
        monthString = [NSString stringWithFormat:@"%ld", (long)month];
    }
    
    NSString *yearString = [NSString stringWithFormat:@"%ld", (long)(year)];
    
    return [NSString stringWithFormat:@"%@/%@",monthString, yearString];
}

@end


