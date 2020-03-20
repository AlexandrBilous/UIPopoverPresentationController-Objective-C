//
//  DatePickerViewController.m
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import "DatePickerViewController.h"


@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (instancetype)initWithDate: (NSDate*) date{
    self = [super init];
    if (self) {
        self.date = date;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
}

- (void) setupView {
    UIDatePicker * datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.date = _date;
    datePicker.maximumDate = [NSDate date];
    datePicker.frame = CGRectMake(0, 0, 300, 300);
    
    [datePicker addTarget:self action:@selector(dateValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:datePicker];
    [self.view setBackgroundColor:UIColor.grayColor];
}

#pragma mark - Actions

- (void) dateValueDidChange: (UIDatePicker*) sender {
    [self.delegate valueOfDatePickerDidChange:sender];
}

@end
