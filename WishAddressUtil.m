//
//  WishAddressUtil.m
//  Wish
//
//  Created by Christopher Fayoux on 7/15/13.
//  Copyright (c) 2013 ContextLogic. All rights reserved.
//

#import "WishAddressUtil.h"
#import "WishUserStatusManager.h"
#import "NSDictionary+Value.h"

@implementation WishAddressUtil

static NSMutableDictionary *_countryMap;

+ (NSDictionary *)getStateMap
{
    return [WishUserStatusManager instance].shippingLocations;
}

+ (NSDictionary *)getCountryMap
{
    if (_countryMap == nil) {
        _countryMap = [[NSMutableDictionary alloc] init];
        [_countryMap setObject:NSLocalizedString(@"United States", nil) forKey:@"US"];
        [_countryMap setObject:NSLocalizedString(@"Canada", nil) forKey:@"CA"];
        [_countryMap setObject:NSLocalizedString(@"Mexico", nil) forKey:@"MX"];
        [_countryMap setObject:NSLocalizedString(@"Afghanistan", nil) forKey:@"AF"];
        [_countryMap setObject:NSLocalizedString(@"Albania", nil) forKey:@"AL"];
        [_countryMap setObject:NSLocalizedString(@"Algeria", nil) forKey:@"DZ"];
        [_countryMap setObject:NSLocalizedString(@"American Samoa", nil) forKey:@"AS"];
        [_countryMap setObject:NSLocalizedString(@"Andorra", nil) forKey:@"AD"];
        [_countryMap setObject:NSLocalizedString(@"Angola", nil) forKey:@"AO"];
        [_countryMap setObject:NSLocalizedString(@"Anguilla", nil) forKey:@"AI"];
        [_countryMap setObject:NSLocalizedString(@"Antarctica", nil) forKey:@"AQ"];
        [_countryMap setObject:NSLocalizedString(@"Antigua & Barbuda", nil) forKey:@"AG"];
        [_countryMap setObject:NSLocalizedString(@"Argentina", nil) forKey:@"AR"];
        [_countryMap setObject:NSLocalizedString(@"Armenia", nil) forKey:@"AM"];
        [_countryMap setObject:NSLocalizedString(@"Aruba", nil) forKey:@"AW"];
        [_countryMap setObject:NSLocalizedString(@"Australia", nil) forKey:@"AU"];
        [_countryMap setObject:NSLocalizedString(@"Austria", nil) forKey:@"AT"];
        [_countryMap setObject:NSLocalizedString(@"Azerbaijan", nil) forKey:@"AZ"];
        [_countryMap setObject:NSLocalizedString(@"Bahama", nil) forKey:@"BS"];
        [_countryMap setObject:NSLocalizedString(@"Bahrain", nil) forKey:@"BH"];
        [_countryMap setObject:NSLocalizedString(@"Bangladesh", nil) forKey:@"BD"];
        [_countryMap setObject:NSLocalizedString(@"Barbados", nil) forKey:@"BB"];
        [_countryMap setObject:NSLocalizedString(@"Belarus", nil) forKey:@"BY"];
        [_countryMap setObject:NSLocalizedString(@"Belgium", nil) forKey:@"BE"];
        [_countryMap setObject:NSLocalizedString(@"Belize", nil) forKey:@"BZ"];
        [_countryMap setObject:NSLocalizedString(@"Benin", nil) forKey:@"BJ"];
        [_countryMap setObject:NSLocalizedString(@"Bermuda", nil) forKey:@"BM"];
        [_countryMap setObject:NSLocalizedString(@"Bhutan", nil) forKey:@"BT"];
        [_countryMap setObject:NSLocalizedString(@"Bolivia", nil) forKey:@"BO"];
        [_countryMap setObject:NSLocalizedString(@"Bosnia and Herzegovina", nil) forKey:@"BA"];
        [_countryMap setObject:NSLocalizedString(@"Botswana", nil) forKey:@"BW"];
        [_countryMap setObject:NSLocalizedString(@"Bouvet Island", nil) forKey:@"BV"];
        [_countryMap setObject:NSLocalizedString(@"Brazil", nil) forKey:@"BR"];
        [_countryMap setObject:NSLocalizedString(@"British Indian Ocean Territory", nil) forKey:@"IO"];
        [_countryMap setObject:NSLocalizedString(@"British Virgin Islands", nil) forKey:@"VG"];
        [_countryMap setObject:NSLocalizedString(@"Brunei Darussalam", nil) forKey:@"BN"];
        [_countryMap setObject:NSLocalizedString(@"Bulgaria", nil) forKey:@"BG"];
        [_countryMap setObject:NSLocalizedString(@"Burkina Faso", nil) forKey:@"BF"];
        [_countryMap setObject:NSLocalizedString(@"Burundi", nil) forKey:@"BI"];
        [_countryMap setObject:NSLocalizedString(@"Cambodia", nil) forKey:@"KH"];
        [_countryMap setObject:NSLocalizedString(@"Cameroon", nil) forKey:@"CM"];
        [_countryMap setObject:NSLocalizedString(@"Cape Verde", nil) forKey:@"CV"];
        [_countryMap setObject:NSLocalizedString(@"Cayman Islands", nil) forKey:@"KY"];
        [_countryMap setObject:NSLocalizedString(@"Central African Republic", nil) forKey:@"CF"];
        [_countryMap setObject:NSLocalizedString(@"Chad", nil) forKey:@"TD"];
        [_countryMap setObject:NSLocalizedString(@"Chile", nil) forKey:@"CL"];
        [_countryMap setObject:NSLocalizedString(@"China", nil) forKey:@"CN"];
        [_countryMap setObject:NSLocalizedString(@"Christmas Island", nil) forKey:@"CX"];
        [_countryMap setObject:NSLocalizedString(@"Cocos (Keeling) Islands", nil) forKey:@"CC"];
        [_countryMap setObject:NSLocalizedString(@"Colombia", nil) forKey:@"CO"];
        [_countryMap setObject:NSLocalizedString(@"Comoros", nil) forKey:@"KM"];
        [_countryMap setObject:NSLocalizedString(@"Congo", nil) forKey:@"CG"];
        [_countryMap setObject:NSLocalizedString(@"Cook Islands", nil) forKey:@"CK"];
        [_countryMap setObject:NSLocalizedString(@"Costa Rica", nil) forKey:@"CR"];
        [_countryMap setObject:NSLocalizedString(@"Croatia", nil) forKey:@"HR"];
        [_countryMap setObject:NSLocalizedString(@"Cuba", nil) forKey:@"CU"];
        [_countryMap setObject:NSLocalizedString(@"Cyprus", nil) forKey:@"CY"];
        [_countryMap setObject:NSLocalizedString(@"Czech Republic", nil) forKey:@"CZ"];
        [_countryMap setObject:NSLocalizedString(@"Denmark", nil) forKey:@"DK"];
        [_countryMap setObject:NSLocalizedString(@"Djibouti", nil) forKey:@"DJ"];
        [_countryMap setObject:NSLocalizedString(@"Dominica", nil) forKey:@"DM"];
        [_countryMap setObject:NSLocalizedString(@"Dominican Republic", nil) forKey:@"DO"];
        [_countryMap setObject:NSLocalizedString(@"East Timor", nil) forKey:@"TP"];
        [_countryMap setObject:NSLocalizedString(@"Ecuador", nil) forKey:@"EC"];
        [_countryMap setObject:NSLocalizedString(@"Egypt", nil) forKey:@"EG"];
        [_countryMap setObject:NSLocalizedString(@"El Salvador", nil) forKey:@"SV"];
        [_countryMap setObject:NSLocalizedString(@"Equatorial Guinea", nil) forKey:@"GQ"];
        [_countryMap setObject:NSLocalizedString(@"Eritrea", nil) forKey:@"ER"];
        [_countryMap setObject:NSLocalizedString(@"Estonia", nil) forKey:@"EE"];
        [_countryMap setObject:NSLocalizedString(@"Ethiopia", nil) forKey:@"ET"];
        [_countryMap setObject:NSLocalizedString(@"Falkland Islands (Malvinas)", nil) forKey:@"FK"];
        [_countryMap setObject:NSLocalizedString(@"Faroe Islands", nil) forKey:@"FO"];
        [_countryMap setObject:NSLocalizedString(@"Fiji", nil) forKey:@"FJ"];
        [_countryMap setObject:NSLocalizedString(@"Finland", nil) forKey:@"FI"];
        [_countryMap setObject:NSLocalizedString(@"France", nil) forKey:@"FR"];
        [_countryMap setObject:NSLocalizedString(@"France: Metropolitan", nil) forKey:@"FX"];
        [_countryMap setObject:NSLocalizedString(@"French Guiana", nil) forKey:@"GF"];
        [_countryMap setObject:NSLocalizedString(@"French Polynesia", nil) forKey:@"PF"];
        [_countryMap setObject:NSLocalizedString(@"French Southern Territories", nil) forKey:@"TF"];
        [_countryMap setObject:NSLocalizedString(@"Gabon", nil) forKey:@"GA"];
        [_countryMap setObject:NSLocalizedString(@"Gambia", nil) forKey:@"GM"];
        [_countryMap setObject:NSLocalizedString(@"Georgia", nil) forKey:@"GE"];
        [_countryMap setObject:NSLocalizedString(@"Germany", nil) forKey:@"DE"];
        [_countryMap setObject:NSLocalizedString(@"Ghana", nil) forKey:@"GH"];
        [_countryMap setObject:NSLocalizedString(@"Gibraltar", nil) forKey:@"GI"];
        [_countryMap setObject:NSLocalizedString(@"Greece", nil) forKey:@"GR"];
        [_countryMap setObject:NSLocalizedString(@"Greenland", nil) forKey:@"GL"];
        [_countryMap setObject:NSLocalizedString(@"Grenada", nil) forKey:@"GD"];
        [_countryMap setObject:NSLocalizedString(@"Guadeloupe", nil) forKey:@"GP"];
        [_countryMap setObject:NSLocalizedString(@"Guam", nil) forKey:@"GU"];
        [_countryMap setObject:NSLocalizedString(@"Guatemala", nil) forKey:@"GT"];
        [_countryMap setObject:NSLocalizedString(@"Guinea", nil) forKey:@"GN"];
        [_countryMap setObject:NSLocalizedString(@"Guinea-Bissau", nil) forKey:@"GW"];
        [_countryMap setObject:NSLocalizedString(@"Guyana", nil) forKey:@"GY"];
        [_countryMap setObject:NSLocalizedString(@"Haiti", nil) forKey:@"HT"];
        [_countryMap setObject:NSLocalizedString(@"Heard & McDonald Islands", nil) forKey:@"HM"];
        [_countryMap setObject:NSLocalizedString(@"Honduras", nil) forKey:@"HN"];
        [_countryMap setObject:NSLocalizedString(@"Hong Kong", nil) forKey:@"HK"];
        [_countryMap setObject:NSLocalizedString(@"Hungary", nil) forKey:@"HU"];
        [_countryMap setObject:NSLocalizedString(@"Iceland", nil) forKey:@"IS"];
        [_countryMap setObject:NSLocalizedString(@"India", nil) forKey:@"IN"];
        [_countryMap setObject:NSLocalizedString(@"Indonesia", nil) forKey:@"ID"];
        [_countryMap setObject:NSLocalizedString(@"Iraq", nil) forKey:@"IQ"];
        [_countryMap setObject:NSLocalizedString(@"Ireland", nil) forKey:@"IE"];
        [_countryMap setObject:NSLocalizedString(@"Islamic Republic of Iran", nil) forKey:@"IR"];
        [_countryMap setObject:NSLocalizedString(@"Israel", nil) forKey:@"IL"];
        [_countryMap setObject:NSLocalizedString(@"Italy", nil) forKey:@"IT"];
        [_countryMap setObject:NSLocalizedString(@"Ivory Coast", nil) forKey:@"CI"];
        [_countryMap setObject:NSLocalizedString(@"Jamaica", nil) forKey:@"JM"];
        [_countryMap setObject:NSLocalizedString(@"Japan", nil) forKey:@"JP"];
        [_countryMap setObject:NSLocalizedString(@"Jordan", nil) forKey:@"JO"];
        [_countryMap setObject:NSLocalizedString(@"Kazakhstan", nil) forKey:@"KZ"];
        [_countryMap setObject:NSLocalizedString(@"Kenya", nil) forKey:@"KE"];
        [_countryMap setObject:NSLocalizedString(@"Kiribati", nil) forKey:@"KI"];
        [_countryMap setObject:NSLocalizedString(@"Korea: Republic of", nil) forKey:@"KR"];
        [_countryMap setObject:NSLocalizedString(@"Kuwait", nil) forKey:@"KW"];
        [_countryMap setObject:NSLocalizedString(@"Kyrgyzstan", nil) forKey:@"KG"];
        [_countryMap setObject:NSLocalizedString(@"Lao People's Democratic Republic", nil) forKey:@"LA"];
        [_countryMap setObject:NSLocalizedString(@"Latvia", nil) forKey:@"LV"];
        [_countryMap setObject:NSLocalizedString(@"Lebanon", nil) forKey:@"LB"];
        [_countryMap setObject:NSLocalizedString(@"Lesotho", nil) forKey:@"LS"];
        [_countryMap setObject:NSLocalizedString(@"Liberia", nil) forKey:@"LR"];
        [_countryMap setObject:NSLocalizedString(@"Libyan Arab Jamahiriya", nil) forKey:@"LY"];
        [_countryMap setObject:NSLocalizedString(@"Liechtenstein", nil) forKey:@"LI"];
        [_countryMap setObject:NSLocalizedString(@"Lithuania", nil) forKey:@"LT"];
        [_countryMap setObject:NSLocalizedString(@"Luxembourg", nil) forKey:@"LU"];
        [_countryMap setObject:NSLocalizedString(@"Macau", nil) forKey:@"MO"];
        [_countryMap setObject:NSLocalizedString(@"Madagascar", nil) forKey:@"MG"];
        [_countryMap setObject:NSLocalizedString(@"Malawi", nil) forKey:@"MW"];
        [_countryMap setObject:NSLocalizedString(@"Malaysia", nil) forKey:@"MY"];
        [_countryMap setObject:NSLocalizedString(@"Maldives", nil) forKey:@"MV"];
        [_countryMap setObject:NSLocalizedString(@"Mali", nil) forKey:@"ML"];
        [_countryMap setObject:NSLocalizedString(@"Malta", nil) forKey:@"MT"];
        [_countryMap setObject:NSLocalizedString(@"Marshall Islands", nil) forKey:@"MH"];
        [_countryMap setObject:NSLocalizedString(@"Martinique", nil) forKey:@"MQ"];
        [_countryMap setObject:NSLocalizedString(@"Mauritania", nil) forKey:@"MR"];
        [_countryMap setObject:NSLocalizedString(@"Mauritius", nil) forKey:@"MU"];
        [_countryMap setObject:NSLocalizedString(@"Mayotte", nil) forKey:@"YT"];
        [_countryMap setObject:NSLocalizedString(@"Micronesia", nil) forKey:@"FM"];
        [_countryMap setObject:NSLocalizedString(@"Moldova: Republic of", nil) forKey:@"MD"];
        [_countryMap setObject:NSLocalizedString(@"Monaco", nil) forKey:@"MC"];
        [_countryMap setObject:NSLocalizedString(@"Mongolia", nil) forKey:@"MN"];
        [_countryMap setObject:NSLocalizedString(@"Montserrat", nil) forKey:@"MS"];
        [_countryMap setObject:NSLocalizedString(@"Morocco", nil) forKey:@"MA"];
        [_countryMap setObject:NSLocalizedString(@"Mozambique", nil) forKey:@"MZ"];
        [_countryMap setObject:NSLocalizedString(@"Myanmar", nil) forKey:@"MM"];
        [_countryMap setObject:NSLocalizedString(@"Namibia", nil) forKey:@"NA"];
        [_countryMap setObject:NSLocalizedString(@"Nauru", nil) forKey:@"NR"];
        [_countryMap setObject:NSLocalizedString(@"Nepal", nil) forKey:@"NP"];
        [_countryMap setObject:NSLocalizedString(@"Netherlands", nil) forKey:@"NL"];
        [_countryMap setObject:NSLocalizedString(@"Netherlands Antilles", nil) forKey:@"AN"];
        [_countryMap setObject:NSLocalizedString(@"New Caledonia", nil) forKey:@"NC"];
        [_countryMap setObject:NSLocalizedString(@"New Zealand", nil) forKey:@"NZ"];
        [_countryMap setObject:NSLocalizedString(@"Nicaragua", nil) forKey:@"NI"];
        [_countryMap setObject:NSLocalizedString(@"Niger", nil) forKey:@"NE"];
        [_countryMap setObject:NSLocalizedString(@"Nigeria", nil) forKey:@"NG"];
        [_countryMap setObject:NSLocalizedString(@"Niue", nil) forKey:@"NU"];
        [_countryMap setObject:NSLocalizedString(@"Norfolk Island", nil) forKey:@"NF"];
        [_countryMap setObject:NSLocalizedString(@"Northern Mariana Islands", nil) forKey:@"MP"];
        [_countryMap setObject:NSLocalizedString(@"Norway", nil) forKey:@"NO"];
        [_countryMap setObject:NSLocalizedString(@"Oman", nil) forKey:@"OM"];
        [_countryMap setObject:NSLocalizedString(@"Pakistan", nil) forKey:@"PK"];
        [_countryMap setObject:NSLocalizedString(@"Palau", nil) forKey:@"PW"];
        [_countryMap setObject:NSLocalizedString(@"Panama", nil) forKey:@"PA"];
        [_countryMap setObject:NSLocalizedString(@"Papua New Guinea", nil) forKey:@"PG"];
        [_countryMap setObject:NSLocalizedString(@"Paraguay", nil) forKey:@"PY"];
        [_countryMap setObject:NSLocalizedString(@"Peru", nil) forKey:@"PE"];
        [_countryMap setObject:NSLocalizedString(@"Philippines", nil) forKey:@"PH"];
        [_countryMap setObject:NSLocalizedString(@"Pitcairn", nil) forKey:@"PN"];
        [_countryMap setObject:NSLocalizedString(@"Poland", nil) forKey:@"PL"];
        [_countryMap setObject:NSLocalizedString(@"Portugal", nil) forKey:@"PT"];
        [_countryMap setObject:NSLocalizedString(@"Puerto Rico", nil) forKey:@"PR"];
        [_countryMap setObject:NSLocalizedString(@"Qatar", nil) forKey:@"QA"];
        [_countryMap setObject:NSLocalizedString(@"Reunion", nil) forKey:@"RE"];
        [_countryMap setObject:NSLocalizedString(@"Romania", nil) forKey:@"RO"];
        [_countryMap setObject:NSLocalizedString(@"Russian Federation", nil) forKey:@"RU"];
        [_countryMap setObject:NSLocalizedString(@"Rwanda", nil) forKey:@"RW"];
        [_countryMap setObject:NSLocalizedString(@"Saint Lucia", nil) forKey:@"LC"];
        [_countryMap setObject:NSLocalizedString(@"Samoa", nil) forKey:@"WS"];
        [_countryMap setObject:NSLocalizedString(@"San Marino", nil) forKey:@"SM"];
        [_countryMap setObject:NSLocalizedString(@"Sao Tome & Principe", nil) forKey:@"ST"];
        [_countryMap setObject:NSLocalizedString(@"Saudi Arabia", nil) forKey:@"SA"];
        [_countryMap setObject:NSLocalizedString(@"Senegal", nil) forKey:@"SN"];
        [_countryMap setObject:NSLocalizedString(@"Serbia", nil) forKey:@"RS"];
        [_countryMap setObject:NSLocalizedString(@"Seychelles", nil) forKey:@"SC"];
        [_countryMap setObject:NSLocalizedString(@"Sierra Leone", nil) forKey:@"SL"];
        [_countryMap setObject:NSLocalizedString(@"Singapore", nil) forKey:@"SG"];
        [_countryMap setObject:NSLocalizedString(@"Slovakia", nil) forKey:@"SK"];
        [_countryMap setObject:NSLocalizedString(@"Slovenia", nil) forKey:@"SI"];
        [_countryMap setObject:NSLocalizedString(@"Solomon Islands", nil) forKey:@"SB"];
        [_countryMap setObject:NSLocalizedString(@"Somalia", nil) forKey:@"SO"];
        [_countryMap setObject:NSLocalizedString(@"South Africa", nil) forKey:@"ZA"];
        [_countryMap setObject:NSLocalizedString(@"Spain", nil) forKey:@"ES"];
        [_countryMap setObject:NSLocalizedString(@"Sri Lanka", nil) forKey:@"LK"];
        [_countryMap setObject:NSLocalizedString(@"St. Helena", nil) forKey:@"SH"];
        [_countryMap setObject:NSLocalizedString(@"St. Kitts and Nevis", nil) forKey:@"KN"];
        [_countryMap setObject:NSLocalizedString(@"St. Pierre & Miquelon", nil) forKey:@"PM"];
        [_countryMap setObject:NSLocalizedString(@"St. Vincent & the Grenadines", nil) forKey:@"VC"];
        [_countryMap setObject:NSLocalizedString(@"Sudan", nil) forKey:@"SD"];
        [_countryMap setObject:NSLocalizedString(@"Suriname", nil) forKey:@"SR"];
        [_countryMap setObject:NSLocalizedString(@"Svalbard & Jan Mayen Islands", nil) forKey:@"SJ"];
        [_countryMap setObject:NSLocalizedString(@"Swaziland", nil) forKey:@"SZ"];
        [_countryMap setObject:NSLocalizedString(@"Sweden", nil) forKey:@"SE"];
        [_countryMap setObject:NSLocalizedString(@"Switzerland", nil) forKey:@"CH"];
        [_countryMap setObject:NSLocalizedString(@"Syrian Arab Republic", nil) forKey:@"SY"];
        [_countryMap setObject:NSLocalizedString(@"Taiwan: Province of China", nil) forKey:@"TW"];
        [_countryMap setObject:NSLocalizedString(@"Tajikistan", nil) forKey:@"TJ"];
        [_countryMap setObject:NSLocalizedString(@"Tanzania: United Republic of", nil) forKey:@"TZ"];
        [_countryMap setObject:NSLocalizedString(@"Thailand", nil) forKey:@"TH"];
        [_countryMap setObject:NSLocalizedString(@"Togo", nil) forKey:@"TG"];
        [_countryMap setObject:NSLocalizedString(@"Tokelau", nil) forKey:@"TK"];
        [_countryMap setObject:NSLocalizedString(@"Tonga", nil) forKey:@"TO"];
        [_countryMap setObject:NSLocalizedString(@"Trinidad & Tobago", nil) forKey:@"TT"];
        [_countryMap setObject:NSLocalizedString(@"Tunisia", nil) forKey:@"TN"];
        [_countryMap setObject:NSLocalizedString(@"Turkey", nil) forKey:@"TR"];
        [_countryMap setObject:NSLocalizedString(@"Turkmenistan", nil) forKey:@"TM"];
        [_countryMap setObject:NSLocalizedString(@"Turks & Caicos Islands", nil) forKey:@"TC"];
        [_countryMap setObject:NSLocalizedString(@"Tuvalu", nil) forKey:@"TV"];
        [_countryMap setObject:NSLocalizedString(@"Uganda", nil) forKey:@"UG"];
        [_countryMap setObject:NSLocalizedString(@"Ukraine", nil) forKey:@"UA"];
        [_countryMap setObject:NSLocalizedString(@"United Arab Emirates", nil) forKey:@"AE"];
        [_countryMap setObject:NSLocalizedString(@"United Kingdom (Great Britain)", nil) forKey:@"GB"];
        [_countryMap setObject:NSLocalizedString(@"United States Virgin Islands", nil) forKey:@"VI"];
        [_countryMap setObject:NSLocalizedString(@"Uruguay", nil) forKey:@"UY"];
        [_countryMap setObject:NSLocalizedString(@"Uzbekistan", nil) forKey:@"UZ"];
        [_countryMap setObject:NSLocalizedString(@"Vanuatu", nil) forKey:@"VU"];
        [_countryMap setObject:NSLocalizedString(@"Vatican City State (Holy See)", nil) forKey:@"VA"];
        [_countryMap setObject:NSLocalizedString(@"Venezuela", nil) forKey:@"VE"];
        [_countryMap setObject:NSLocalizedString(@"Vietnam", nil) forKey:@"VN"];
        [_countryMap setObject:NSLocalizedString(@"Wallis & Futuna Islands", nil) forKey:@"WF"];
        [_countryMap setObject:NSLocalizedString(@"Western Sahara", nil) forKey:@"EH"];
        [_countryMap setObject:NSLocalizedString(@"Yemen", nil) forKey:@"YE"];
        [_countryMap setObject:NSLocalizedString(@"Zaire", nil) forKey:@"ZR"];
        [_countryMap setObject:NSLocalizedString(@"Zambia", nil) forKey:@"ZM"];
        [_countryMap setObject:NSLocalizedString(@"Zimbabwe", nil) forKey:@"ZW"];
    }
    return _countryMap;
}

+ (NSString *)getSubdivisionNameForCountry:(NSString *)countryCode
{
    if ([WishUserStatusManager instance].countrySubdivNames) {
        return [[WishUserStatusManager instance].countrySubdivNames stringValueForKey:[countryCode uppercaseString]
                                                                     defaultValue:NSLocalizedString(@"State", nil)];
    } else {
        return NSLocalizedString(@"State", nil);
    }
}

@end
