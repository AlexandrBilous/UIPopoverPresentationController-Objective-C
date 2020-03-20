//
//  DatePickerViewController.h
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DatePickerViewControllerDelegate <NSObject>

@optional
- (void) valueOfDatePickerDidChange: (UIDatePicker*) datePicker;

@end

@interface DatePickerViewController : UIViewController <DatePickerViewControllerDelegate>

- (instancetype)initWithDate:(NSDate*) date;

@property (weak, nonatomic) id <DatePickerViewControllerDelegate> delegate;
@property (strong, nonatomic) NSDate * date;

@end





NS_ASSUME_NONNULL_END
