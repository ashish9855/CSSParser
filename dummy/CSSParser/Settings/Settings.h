//
//  Settings.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "storeTheParsedData.h"

@interface Settings : NSObject


+(BOOL)isClassPresent:(NSString *)classOfCSS;
+(NSDictionary *)getAllTheCSSKeys:(NSString *)classOfCSS;
+(BOOL)doesClass:(NSDictionary *)cssClass containsKey:(NSString *)key;

@end
