//
//  KJMCalculator.h
//
//  Created by Kevin Morton on 8/18/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KJMCalculator : NSObject

/*************** Arithmatic ***********/

+ (NSNumber *)add:(NSNumber *)number to:(NSNumber *)number2;
+ (NSNumber *)subtract:(NSNumber *)number from:(NSNumber *)number2;
+ (NSNumber *)multiply:(NSNumber *)number with:(NSNumber *)number2;
+ (NSNumber *)divide:(NSNumber *)number by:(NSNumber *)number2;

+ (NSNumber *)sumItemsInArray:(NSArray *)data;

+ (NSNumber *)averageItems:(NSArray *)data;

/*************** Rounding ***********/

/**
 *  General rounding behavior for the calculator class.
 *
 *  @return NSDecimalNumberHandler formatted to NSRoundPlain to 2 decimals and exception if dividing by zero
 */
+ (NSDecimalNumberHandler *)kjmRoundingBehavior;
+ (NSDecimalNumberHandler *)kmCalculatorRoundingScale:(short)scale;

@end
