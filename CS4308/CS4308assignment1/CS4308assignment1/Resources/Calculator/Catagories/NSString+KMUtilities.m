//
//  NSNumber+KMUtilities.m
//  CS4308assignment1
//
//  Created by Kevin Morton on 1/18/16.
//  Copyright © 2016 KevinMorton. All rights reserved.
//

#import "NSString+KMUtilities.h"

@implementation NSString (KMUtilities)

- (NSNumber *)kjmNumberValue
{
    return [[self numberFormatter] numberFromString:self];
}

- (NSNumberFormatter *)numberFormatter
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
