//
//  ComputeAverageViewController.m
//  CS4308assignment1
//
//  Created by Kevin Morton on 1/18/16.
//  Copyright © 2016 KevinMorton. All rights reserved.
//

#import "ComputeAverageViewController.h"
#import "KJMCalculatorIncludes.h"
@import RMPickerViewController;

typedef NS_ENUM (NSInteger, KMSegmentControlIndex) {
    KMSegmentControlIndexAverage,
    KMSegmentControlIndexHistory
};

@interface ComputeAverageViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

/**
 *  All numbers entered are stored in this array.
 */
@property (nonatomic, strong) NSMutableArray *runningAverage;
@property (nonatomic, weak) IBOutlet UIButton *computeButton;

/**
 *  History of all numbers used in current average.
 */
@property (nonatomic, strong) NSMutableString *historyString;

/**
 *  Displays the current average and history of all numbers entered.
 */
@property (nonatomic, weak) IBOutlet UITextView *numericDisplayTextView;

/**
 *  Creates a mutable string displaying all values used in the final average calculation.
 *
 *  @param value Users most recently selected value from the picker (to be added to the running avgerage).
 */
- (void)updateHistoryWithValue:(NSString *)value;

/**
 *  Updates all variables with the most recently selected value.
 *
 *  @param value Users most recently selected value from the picker.
 */
- (void)addValueToCurrentAverage:(NSNumber *)value;

@end

@implementation ComputeAverageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addValueToCurrentAverage:(NSNumber *)value {
    if (!self.runningAverage) {
        self.runningAverage = [[NSMutableArray alloc] init];
    }
    
    [self.runningAverage addObject:value];
    [self updateHistoryWithValue:value.stringValue];
    self.numericDisplayTextView.text = [self currentAverage].stringValue;
}

- (void)updateHistoryWithValue:(NSString *)value {
    if (self.historyString) {
        [self.historyString appendString:[NSString stringWithFormat:@" + %@", value]];
    }
    else {
        self.historyString = [NSString stringWithFormat:@"%@", value].mutableCopy;
    }
}

- (IBAction)didPressComputeButton:(id)sender {
    self.numericDisplayTextView.text = [self currentAverage].stringValue;
}

- (IBAction)didPressClearButton:(id)sender {
    // Clear all current data and start over.
    self.runningAverage              = nil;
    self.numericDisplayTextView.text = @"0";
    self.historyString               = nil;
}

- (IBAction)didPressSegmentControl:(UISegmentedControl *)sender {
    // Switch between viewing the current average and a history of all numbers used in the calculation.
    if ([sender selectedSegmentIndex] == KMSegmentControlIndexAverage) {
        self.numericDisplayTextView.text = [self currentAverage].stringValue;
    }
    else if ([sender selectedSegmentIndex] == KMSegmentControlIndexHistory) {
        self.numericDisplayTextView.text = self.historyString;
    }
}

- (NSNumber *)currentAverage {
    return [KJMCalculator averageItems:self.runningAverage];
}

#pragma mark - RMPickerViewController Delegate -

- (IBAction)showNumericalPickerView {
    // Numerical picker for the user to select a number to add to the running average.
    RMAction<RMActionController<UIPickerView *> *> *selectAction = [RMAction<RMActionController < UIPickerView *> * > actionWithTitle:@"OK" style:RMActionStyleDone andHandler:^(RMActionController < UIPickerView * > *controller) {
        NSMutableArray *selectedRows = [NSMutableArray array];
        
        for (NSInteger i = 0; i < (controller.contentView).numberOfComponents; i++) {
            [selectedRows addObject:@([controller.contentView selectedRowInComponent:i])];
        }
        
        [self addValueToCurrentAverage:selectedRows[0]];
    }];
    
    RMPickerViewController *pickerController = [RMPickerViewController actionControllerWithStyle:RMActionControllerStyleWhite
                                                                                    selectAction:selectAction
                                                                                 andCancelAction:[RMAction actionWithTitle:@"Cancel" style:RMActionStyleCancel andHandler:nil]];
    pickerController.title                  = @"Pick a number";
    pickerController.picker.delegate        = self;
    pickerController.picker.dataSource      = self;
    pickerController.disableBouncingEffects = TRUE;
    pickerController.disableMotionEffects   = TRUE;
    pickerController.disableBlurEffects     = TRUE;
    
    // Show the picker view for the user to select a new number.
    [self.navigationController presentViewController:pickerController animated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 100;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%lu", (long)row];
}

@end
