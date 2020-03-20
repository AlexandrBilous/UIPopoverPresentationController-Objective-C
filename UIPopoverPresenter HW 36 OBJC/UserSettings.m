//
//  UserSettings.m
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import "UserSettings.h"

@implementation UserSettings

static NSString* kForFirstName = @"";
static NSString* kForLastName = @"";
static NSString* kForSex = @"";
static NSString * kForDate = @"";
static NSString * kForEducation = @"";

- (void) loadSettings {
    NSUserDefaults *userD = NSUserDefaults.standardUserDefaults;
    NSString * firstName = [userD objectForKey:kForFirstName];
    NSString * lastName = [userD objectForKey:kForLastName];
    NSString * sex = [userD objectForKey:kForSex];
    NSString * date = [userD objectForKey:kForDate];
    NSString * education = [userD objectForKey:kForEducation];
    
}

- (void) saveSettings {
    NSUserDefaults *userD = NSUserDefaults.standardUserDefaults;
}


@end
