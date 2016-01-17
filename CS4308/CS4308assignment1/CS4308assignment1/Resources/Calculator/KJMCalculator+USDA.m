//
//  KJMCalculator+USDA.m
//  FoodRX_version2
//
//  Created by Kevin Morton on 8/18/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import "KJMCalculator+USDA.h"
#import "KJM_Macros.h"

@implementation KJMCalculator (USDA)

#define debug 1

+ (NSNumber *)normalizeUSDAValue:(NSNumber *)number
{
    // Normalize nutrient values to amount per 1 gram by dividing by 100
    NSDecimalNumber *sourceOne   = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    NSDecimalNumber *denominator = [NSDecimalNumber decimalNumberWithString:@"100.00"];
    
    return [self divide:sourceOne by:denominator];
}

+ (NSNumber *)usdaValueFromGrams:(NSNumber *)grams nutrientValue:(NSNumber *)nutrientValue
{
    NSDecimalNumber *sourceOne = [NSDecimalNumber decimalNumberWithDecimal:grams.decimalValue];
    NSDecimalNumber *sourceTwo = [NSDecimalNumber decimalNumberWithDecimal:[self normalizeUSDAValue:nutrientValue].decimalValue];
    
    return [sourceOne decimalNumberByMultiplyingBy:sourceTwo withBehavior:[self kjmRoundingBehavior]];
}


@end
