//
//  NSArray+KMarrayUtilities.m
//  CS4308assignment1
//
//  Created by Kevin Morton on 1/17/16.
//  Copyright © 2016 KevinMorton. All rights reserved.
//

#import "NSArray+KMarrayUtilities.h"

@implementation NSArray (KMarrayUtilities)

+ (NSArray *)numericalArrayWithStartValue:(NSNumber *)startValue endValue:(NSNumber *)endValue
{
    NSMutableArray *numbersArray = [NSMutableArray new];
    
    for (int i = 0; i < endValue.intValue; i++) {
        [numbersArray addObject:[NSNumber numberWithInt:i]];
    }
    
    return numbersArray;
}

+ (NSArray *)numericalArrayFromZeroToEndValue:(NSNumber *)endValue
{
    return [self numericalArrayWithStartValue:@0 endValue:endValue];
}

+ (NSArray *)numericalStringArrayFromZeroToEndValue:(NSNumber *)endValue
{
    NSMutableArray *stringArray = [NSMutableArray new];
    NSArray *numbersArray       = [self numericalArrayWithStartValue:@0 endValue:endValue];
    
    [numbersArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [stringArray addObject:[NSString stringWithFormat:@"%@", (NSNumber *)obj]];
    }];
    
    return stringArray;
}

#pragma mark - Private -

+ (NSNumberFormatter *)numberFormatter
{
    static NSNumberFormatter *_numberFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _numberFormatter = [[NSNumberFormatter alloc] init];
        [_numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    });
    
    return _numberFormatter;
}

@end
