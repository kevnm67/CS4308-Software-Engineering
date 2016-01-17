//
//  KJMCalculator.m
//  FoodRX_version2
//
//  Created by Kevin Morton on 8/18/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import "KJMCalculator.h"

@implementation KJMCalculator

#pragma mark - Arithmatic -

+ (NSNumber *)add:(NSNumber *)number to:(NSNumber *)number2
{
    NSDecimalNumber *sourceOne = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    NSDecimalNumber *sourceTwo = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    
    return [sourceOne decimalNumberByAdding:sourceTwo withBehavior:[self kjmRoundingBehavior]];
}

+ (NSNumber *)subtract:(NSNumber *)number from:(NSNumber *)number2
{
    NSDecimalNumber *sourceOne = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    NSDecimalNumber *sourceTwo = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    
    return [sourceOne decimalNumberBySubtracting:sourceTwo withBehavior:[self kjmRoundingBehavior]];
}

+ (NSNumber *)multiply:(NSNumber *)number with:(NSNumber *)number2
{
    NSDecimalNumber *sourceOne = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    NSDecimalNumber *sourceTwo = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    
    return [sourceOne decimalNumberByMultiplyingBy:sourceTwo withBehavior:[self kjmRoundingBehavior]];
}

+ (NSNumber *)divide:(NSNumber *)number by:(NSNumber *)number2
{
    NSDecimalNumber *sourceOne = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    NSDecimalNumber *sourceTwo = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    
    if ([sourceTwo isEqual:[NSDecimalNumber zero]]) {
        return nil;
    }
    
    return [sourceOne decimalNumberByDividingBy:sourceTwo withBehavior:[self kjmRoundingBehavior]];
}

#pragma mark - Rounding behavior -
+ (NSDecimalNumberHandler *)kjmRoundingBehavior
{
    return [self kmCalculatorRoundingScale:2];
//    return [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
}

+ (NSDecimalNumberHandler *)kmCalculatorRoundingScale:(short)scale
{
    return [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
}

@end
