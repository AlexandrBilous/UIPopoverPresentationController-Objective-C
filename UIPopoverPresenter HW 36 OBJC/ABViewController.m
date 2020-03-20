//
//  ABViewController.m
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 10.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import "ABViewController.h"
#import "AppInfoViewController.h"
#import "DatePickerViewController.h"
#import "EducationViewController.h"

@interface ABViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, UITableViewDelegate>

@property (strong, nonatomic) NSArray * array;
@property (weak, nonatomic) UITextField * date;
@property (weak, nonatomic) UITextField * education;
@property (weak, nonatomic) UITextField * firstName;
@property (weak, nonatomic) UITextField * lastName;
@property (weak, nonatomic) UISegmentedControl * sex;

@property (assign, nonatomic) NSInteger selectedEducation;
@property (assign, nonatomic) NSString * educationString;
@property (strong, nonatomic) NSDate* selectedDaten;


@end

@implementation ABViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) setupNavigation {
    self.array = [NSArray arrayWithObjects:@"FirstName", @"LastName", @"Sex", @"Day Of Birth", @"Education", nil];
    
    UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(infoButtonSelected:)];
    self.navigationItem.rightBarButtonItem = bar;
}

#pragma mark - Actions

- (void) infoButtonSelected: (UIBarButtonItem*) sender {
    AppInfoViewController * info = [[AppInfoViewController alloc] init];
    info.preferredContentSize = CGSizeMake(300, 300);
    info.modalPresentationStyle = UIModalPresentationPopover;

    UIPopoverPresentationController * ppc = info.popoverPresentationController;
    ppc.permittedArrowDirections = UIPopoverArrowDirectionAny;
    ppc.delegate = self;
    ppc.barButtonItem = self.navigationItem.rightBarButtonItem;
    
    [self presentViewController:info animated:YES completion:nil];
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
    }
    
    UIView * view;
    
    UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds) / 2 - 50, 0, 250, 40)];
    field.tag = indexPath.row;
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.delegate = self;
    field.placeholder = [NSString stringWithFormat:@"Enter %@", [self.array objectAtIndex:indexPath.row]];
    
    UISegmentedControl * controll = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Male", @"Female", nil]];
    controll.frame = CGRectMake(CGRectGetWidth(self.view.bounds) / 2 - 50, 0, 250, 40);
    self.sex = controll;

    switch (indexPath.row) {
        case 0:
            self.firstName = field;
            field.autocorrectionType = UITextAutocorrectionTypeNo;
            field.autocapitalizationType = UITextAutocapitalizationTypeWords;
            view = field;
            break;
        case 1:
            self.lastName = field;
            field.autocorrectionType = UITextAutocorrectionTypeNo;
            field.autocapitalizationType = UITextAutocapitalizationTypeWords;
            view = field;
            break;
        case 2:
            view = controll;
            break;
        case 3:
            self.date = field;
            view = field;
            break;
        case 4:
            self.education = field;
            view = field;
            break;
        default:
            view = field;
            break;
    }
    
    [cell.contentView addSubview:view];
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark - #PressMe

- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController: (UIPresentationController * ) controller {
    return UIModalPresentationNone;
}

#pragma mark - UITextFieldDelefate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == 3) {
        [self showDatePicker: textField];
    } else if (textField.tag == 4) {
        [self showEducationPopover:textField];
    }

    return textField.tag < 3;
}


- (void) showDatePicker: (UITextField*) field {
    
    NSDate * date = self.selectedDaten == nil ? [NSDate date] : self.selectedDaten;
    DatePickerViewController * datePicker = [[DatePickerViewController alloc] initWithDate:date];

    datePicker.delegate = self;
    datePicker.modalPresentationStyle = UIModalPresentationPopover;
    datePicker.preferredContentSize = CGSizeMake(300,300);
    
    UIPopoverPresentationController * popOver = [datePicker popoverPresentationController];
    popOver.delegate = self;
    popOver.sourceView = field;
    popOver.sourceRect = field.frame;
    popOver.permittedArrowDirections = UIPopoverArrowDirectionUp;
    
    [self presentViewController:datePicker animated:YES completion:nil];
}

- (void) showEducationPopover: (UITextField*) frame {
    EducationViewController * education = [[EducationViewController alloc] initWithSelectedState:self.selectedEducation];
    education.delegate = self;
    education.modalPresentationStyle = UIModalPresentationPopover;
    education.preferredContentSize = CGSizeMake(300,300);
    
    
    UIPopoverPresentationController * popOver = [education popoverPresentationController];
    popOver.delegate = self;
    popOver.sourceView = frame;
    popOver.sourceRect = frame.frame;
    popOver.permittedArrowDirections = UIPopoverArrowDirectionUp;
    
    [self presentViewController:education animated:YES completion:nil];
}

#pragma mark - DatePickerViewControllerDelegate

- (void) valueOfDatePickerDidChange:(UIDatePicker *)datePicker {
    self.selectedDaten = datePicker.date;
    self.date.text = [self formatValueOfDate:datePicker.date];
}

- (NSString*) formatValueOfDate: (NSDate*) date {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.calendar = [NSCalendar currentCalendar];
    formatter.dateFormat = @"dd.MMM.YYYY";
    return [formatter stringFromDate:date];
}

#pragma mark - EducationViewControllerDelegate

- (void) didSelectRow:(NSInteger)row inComponent:(NSInteger)component withTitle:(NSString *)title {
    self.education.text = title;
    self.educationString = title;
    self.selectedEducation = row;
}

@end
