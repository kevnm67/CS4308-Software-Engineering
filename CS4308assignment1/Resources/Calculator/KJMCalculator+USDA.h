//
//  KJMCalculator+USDA.h
//  FoodRX_version2
//
//  Created by Kevin Morton on 8/18/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import "KJMCalculator.h"

@interface KJMCalculator (USDA)

/*!
 *  Normalize nutrient values to amount per 1 gram by dividing by 100
 *  @return number An NSNumber to 2 decimal places for normalized nutritional USDA values
 */
+ (NSNumber *)normalizeUSDAValue:(NSNumber *)number;
+ (NSNumber *)usdaValueFromGrams:(NSNumber *)grams nutrientValue:(NSNumber *)nutrientValue;

@end
