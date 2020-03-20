//
//  EducationViewController.m
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import "EducationViewController.h"


@interface EducationViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray * array;

@end

@implementation EducationViewController

- (instancetype)initWithSelectedState:(NSInteger)state {
    self = [super init];
    if (self) {
        self.pickedValue = state;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void) setupView {
    self.array = [NSArray arrayWithObjects:@"Pre-school", @"Elementary school", @"Secondary", @"College", @"University - bachelor", @"University - master", @"University - doctor", nil];
    UIPickerView * picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    picker.dataSource = self;
    picker.delegate = self;
    [picker selectRow:_pickedValue inComponent:0 animated:NO];
      
    [self.view addSubview:picker];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.array count];
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self.delegate didSelectRow:row inComponent:component withTitle:[self.array objectAtIndex:row]];
}




@end
