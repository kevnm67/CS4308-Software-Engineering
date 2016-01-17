//
//  KJMCalculator+Fractions.m
//  FoodRX_version2
//
//  Created by Kevin Morton on 8/19/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import "KJMCalculator+Fractions.h"

@implementation KJMCalculator (Fractions)

+ (NSNumber *)getFractionValue:(NSInteger)index
{
    NSNumber *decimalValue;
    
    switch (index) {
        case 0:
            decimalValue = @0;
            
            break;
            
        case 1:
            decimalValue = [self divide:@1 by:@8];
            
            break;
            
        case 2:
            decimalValue = [self divide:@1 by:@4];
            
            break;
            
        case 3:
            decimalValue = [self divide:@1 by:@3];
            
            break;
            
        case 4:
            decimalValue = [self divide:@3 by:@8];
            
            break;
            
        case 5:
            decimalValue = [self divide:@1 by:@2];
            
            break;
            
        case 6:
            decimalValue = [self divide:@5 by:@8];
            
            break;
            
        case 7:
            decimalValue = [self divide:@2 by:@3];
            
            break;
            
        case 8:
            decimalValue = [self divide:@3 by:@4];
            
            break;
            
        case 9:
            decimalValue = [self divide:@7 by:@8];
            
            break;
    } /* switch */
    
    return decimalValue;
}

@end
