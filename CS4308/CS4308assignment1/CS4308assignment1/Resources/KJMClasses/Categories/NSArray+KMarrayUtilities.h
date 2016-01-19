//
//  NSArray+KMarrayUtilities.h
//  CS4308assignment1
//
//  Created by Kevin Morton on 1/17/16.
//  Copyright © 2016 KevinMorton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (KMarrayUtilities)

+ (NSArray *)numericalArrayWithStartValue:(NSNumber *)startValue endValue:(NSNumber *)endValue;

+ (NSArray *)numericalArrayFromZeroToEndValue:(NSNumber *)endValue;

+ (NSArray *)numericalStringArrayFromZeroToEndValue:(NSNumber *)endValue;

@end
