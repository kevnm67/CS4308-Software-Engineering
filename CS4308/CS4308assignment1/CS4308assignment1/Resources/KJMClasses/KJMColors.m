//
//  KJMColors.m
//  PickMyWOD_V2
//
//  Created by Kevin Morton on 7/27/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import "KJMColors.h"

static NSString *const KMDefaultLabelFontName = @"OpenSans-Semibold";


@implementation KJMColors

+ (NSString *)avenirFontName
{
    return @"Avenir-Book";
}

+ (NSString *)avenirBoldFontName
{
    return @"Avenir-Black";
}

+ (NSString *)avenirHeavyFontName
{
    return @"Avenir-Heavy";
}

+ (NSString *)avenirLightFontName
{
    return @"Avenir-Light";
}

#pragma mark - Labels -

+ (UILabel *)labelOpenSansBoldWithTitle:(NSString *)title
{
    UILabel *titleLabel = [UILabel new];
    
    NSDictionary *attributes = @{
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSFontAttributeName: [UIFont fontWithName:KMDefaultLabelFontName size:20.0],
        NSKernAttributeName: @4.0
    };
    
    titleLabel.attributedText = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    [titleLabel sizeToFit];
    
    return titleLabel;
}

#pragma mark - Color -

+ (UIColor *)lightColor
{
    return [UIColor colorWithWhite:0.6 alpha:1.0];
}

+ (UIColor *)gradientColorWithAlpha:(CGFloat)theAlpha
{
    return [UIColor colorWithRed:0.14 green:0.71 blue:0.69 alpha:theAlpha];
}

+ (UIColor *)elementFillColor
{
    return UIColor.whiteColor;
}

#pragma mark - Flat Colors

+ (UIColor *)colorName:(UIColor *)color alpha:(CGFloat)alpha
{
    CGColorRef colorReference   = [color CGColor];
    unsigned long numComponents = CGColorGetNumberOfComponents(colorReference);
    
    UIColor *newColor;
    
    if (numComponents == 4) {
        const CGFloat *components = CGColorGetComponents(colorReference);
        CGFloat red               = components[0];
        CGFloat green             = components[1];
        CGFloat blue              = components[2];
        
        newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    
    return newColor;
}

+ (UIColor *)coolBlueColor
{
    return [UIColor colorWithRed:71 / 255.0 green:165 / 255.0 blue:254 / 255.0 alpha:1];
}

// -------- Blues
+ (UIColor *)flatBlue
{
    return [UIColor colorWithRed:0.245 green:0.664 blue:0.887 alpha:1];
}

// -------- Greens
+ (UIColor *)emeraldGreen
{
    return [UIColor colorWithRed:2 / 255.0f green:236 / 255.0f blue:199 / 255.0 alpha:1];
}

+ (UIColor *)greenNephritis
{
    return [UIColor colorWithRed:39 / 255.0f green:174 / 255.0f blue:96 / 255.0 alpha:1];
}

+ (UIColor *)flatTabbarGreen
{
    return [UIColor colorWithRed:72.0 / 255.0 green:211.0 / 255.0 blue:178.0 / 255.0 alpha:1];
}

+ (UIColor *)flatTabbarPurple
{
    return [UIColor colorWithRed:94.0 / 255.0 green:91.0 / 255.0 blue:149.0 / 255.0 alpha:1];
}

+ (UIColor *)clouds
{
    return [UIColor colorWithRed:236 / 255.0f green:240 / 255.0f blue:241 / 255.0f alpha:1.0f];
}

+ (UIColor *)flatSilver
{
    return [UIColor colorWithRed:189 / 255.0f green:195 / 255.0f blue:199 / 255.0f alpha:1.0f];
}

+ (UIColor *)flatConcreteSilver
{
    return [UIColor colorWithRed:149 / 255.0f green:165 / 255.0f blue:166 / 255.0f alpha:1.0f];
}

+ (UIColor *)lightTextColor
{
    return [UIColor colorWithRed:77.0 / 255.0 green:77.0 / 255.0 blue:77.0 / 255.0 alpha:1];
}

+ (UIColor *)ebonyClay
{
    return [UIColor colorWithRed:34.0 / 255.0 green:49.0 / 255.0 blue:63.0 / 255.0 alpha:1];
}

#pragma mark - Table view colors -

+ (UIColor *)tableviewHeaderBGcolor
{
    return [UIColor colorWithRed:0.835 green:0.835 blue:0.835 alpha:0.3f];
}

+ (UIColor *)tableviewCellSeparatorColor
{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
}

+ (UIColor *)bo_lightGrayColor
{
    return [UIColor colorWithWhite:0.6 alpha:1];
}

+ (UIColor *)bo_grayColor
{
    return [UIColor colorWithWhite:0.5 alpha:1];
}

+ (UIColor *)bo_darkGrayColor
{
    return [UIColor colorWithWhite:0.3 alpha:1];
}

+ (UIColor *)bo_blueColor
{
    return [UIColor colorWithRed:71 / 255.0 green:165 / 255.0 blue:254 / 255.0 alpha:1];
}

@end
