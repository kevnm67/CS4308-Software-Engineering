//
//  KJMColors.h
//
//  Created by Kevin Morton on 7/27/15.
//  Copyright (c) 2015 Kevin Morton. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface KJMColors : NSObject

////Fonts
+ (NSString *)avenirFontName;
+ (NSString *)avenirBoldFontName;
+ (NSString *)avenirHeavyFontName;
+ (NSString *)avenirLightFontName;

////Colors
+ (UIColor *) colorName:(UIColor *)color alpha:(CGFloat)alpha;
+ (UIColor *) lightColor;
+ (UIColor *)gradientColorWithAlpha:(CGFloat)theAlpha;
+ (UIColor *) elementFillColor;


// -------- Theme Colors -------- //
//// Flat colors
+ (UIColor *) coolBlueColor;
+ (UIColor *) flatBlue;
+ (UIColor *) emeraldGreen;
+ (UIColor *) greenNephritis;
+ (UIColor *) flatTabbarGreen;
+ (UIColor *) flatTabbarPurple;
+ (UIColor *) clouds;
+ (UIColor *) flatSilver;
+ (UIColor *) flatConcreteSilver;
+ (UIColor *) lightTextColor;
+ (UIColor *) ebonyClay;

// Table view colors
+ (UIColor *) tableviewHeaderBGcolor;
+ (UIColor *) tableviewCellSeparatorColor;

+ (UIColor *) bo_lightGrayColor;
+ (UIColor *) bo_grayColor;
+ (UIColor *) bo_darkGrayColor;
+ (UIColor *) bo_blueColor;

@end
