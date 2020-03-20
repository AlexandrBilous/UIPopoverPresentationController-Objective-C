//
//  EducationViewController.h
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EducationViewControllerDelegate <NSObject>

@optional
- (void) didSelectRow:(NSInteger)row inComponent:(NSInteger)component withTitle: (NSString*) title;

@end

@interface EducationViewController : UIViewController <EducationViewControllerDelegate>

- (instancetype) initWithSelectedState: (NSInteger) state;

@property (weak, nonatomic) id <EducationViewControllerDelegate> delegate;
@property (assign, nonatomic) NSInteger pickedValue;

@end

NS_ASSUME_NONNULL_END
