//
//  KMCS4308assignment1Tests.m
//  CS4308assignment1
//
//  Created by Kevin Morton on 1/17/16.
//  Copyright © 2016 KevinMorton. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CRLMethodLogFormatter.h"
#import "CS4308assignment1-Environment.h"
#import "KJMCalculatorIncludes.h"
#import "NSArray+KMarrayUtilities.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

//static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface KMCS4308assignment1Tests : XCTestCase

@end

@implementation KMCS4308assignment1Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testNumbersArrayCreation
{
    // Create an array of numbers from 0 to 30
    NSArray *numbers = [NSArray numericalArrayFromZeroToEndValue:@30];
    XCTAssertEqual(numbers.count, (NSUInteger)30);
}

- (void)testSumItemsInArray
{
    // Create an array of numbers from 0 to 30
    NSArray *numbersArray = [NSArray numericalArrayFromZeroToEndValue:@30];
    XCTAssertNotNil(numbersArray);
    
    // Iterate the numbers array and sum all the values.
    NSNumber *sum = [KJMCalculator sumItemsInArray:numbersArray];
    XCTAssertEqual(sum.intValue, (int)435);
}

- (void)testComputeAverageFromItemsInArray
{
    NSArray *numbersArray = [NSArray numericalArrayFromZeroToEndValue:@5];
    XCTAssertNotNil(numbersArray);
    
    // Iterate the numbers array and average all the values.
    NSNumber *avg = [KJMCalculator averageItems:numbersArray];
    // Average of 10 should = 2
    XCTAssertEqual(avg.intValue, (int)2);
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
