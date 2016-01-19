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

typedef NS_ENUM (NSInteger, KMSegmentControlIndex){
    KMSegmentControlIndexAverage,
    KMSegmentControlIndexHistory
};

@interface ComputeAverageViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSMutableArray *runningAverage;
@property (weak, nonatomic) IBOutlet UIButton *computeButton;
@property (strong, nonatomic) NSMutableString *historyString;

/**
 *  Displays the current average of all numbers.
 */
@property (weak, nonatomic) IBOutlet UITextView *numericDisplayTextView;

@end

@implementation ComputeAverageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)addValueToCurrentAverage:(NSNumber *)value
{
    if (!self.runningAverage) {
        self.runningAverage = [[NSMutableArray alloc] init];
    }
    
    [self.runningAverage addObject:value];
    [self updateHistoryWithValue:value.stringValue];
    self.numericDisplayTextView.text = [self currentAverage].stringValue;
}

- (void)updateHistoryWithValue:(NSString *)value
{
    if (self.historyString) {
        [self.historyString appendString:[NSString stringWithFormat:@" + %@", value]];
    }
    else {
        self.historyString = [NSString stringWithFormat:@"%@", value].mutableCopy;
    }
}

- (IBAction)didPressComputeButton:(id)sender
{
    self.numericDisplayTextView.text = [self currentAverage].stringValue;
}

- (IBAction)didPressClearButton:(id)sender
{
    self.runningAverage              = nil;
    self.numericDisplayTextView.text = @"0";
    self.historyString               = nil;
}

- (IBAction)didPressSegmentControl:(UISegmentedControl *)sender
{
    if ([sender selectedSegmentIndex] == KMSegmentControlIndexAverage) {
        self.numericDisplayTextView.text = [self currentAverage].stringValue;
    }
    else if ([sender selectedSegmentIndex] == KMSegmentControlIndexHistory) {
        self.numericDisplayTextView.text = self.historyString;
    }
}

- (NSNumber *)currentAverage
{
    NSNumber *sum = [KJMCalculator sumItemsInArray:self.runningAverage];
    NSLog(@"sum: %@", sum);
    
    NSLog(@"items: %ld", self.runningAverage.count);
    
    return [KJMCalculator averageItems:self.runningAverage];
}

#pragma mark - RMPickerViewController Delegate -

#pragma mark - Actions -

- (IBAction)showNumericalPickerView
{
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
    [self.navigationController presentViewController:pickerController animated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 100;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%lu", (long)row];
}

@end
