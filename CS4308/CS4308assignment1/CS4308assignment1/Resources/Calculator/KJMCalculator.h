//
//  KJMCalculator.h
//
//  Created by Kevin Morton on 8/18/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KJMCalculator : NSObject

#pragma mark - Arithmatic -
/// @name Arithmatic

/**
 *  Add two NSNumbers using decimal formatter. Use the rounding scale and behavior if needed. Default is 2 decimal places.
 *
 *  @param number  First number to use in the calculation.
 *  @param number2 Number to add to the first.
 *
 *  @return Product of the 2 numbers passed in.
 */
+ (NSNumber *)add:(NSNumber *)number to:(NSNumber *)number2;
+ (NSNumber *)subtract:(NSNumber *)number from:(NSNumber *)number2;
+ (NSNumber *)multiply:(NSNumber *)number with:(NSNumber *)number2;
+ (NSNumber *)divide:(NSNumber *)number by:(NSNumber *)number2;

/**
 *  Iterates an array and sums all values.
 *
 *  @param data Array of NSNumbers to process.
 *
 *  @return Sum of all items in the array.
 */
+ (NSNumber *)sumItemsInArray:(NSArray *)data;

/**
 *  Iterates an array and computes the average of all values.
 *
 *  @param data Array of NSNumbers to process.
 *
 *  @return Average of all items in the array.
 */
+ (NSNumber *)averageItems:(NSArray *)data;


#pragma mark - Rounding -
/// @name User Rounding

/**
 *  General rounding behavior for the calculator class.
 *
 *  @return NSDecimalNumberHandler formatted to NSRoundPlain to 2 decimals and exception if dividing by zero
 */
+ (NSDecimalNumberHandler *)kjmRoundingBehavior;
+ (NSDecimalNumberHandler *)kmCalculatorRoundingScale:(short)scale;

@end
