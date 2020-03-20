//
//  UserSettings.h
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 15.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSettings : NSUserDefaults

- (void) loadSettings;
- (void) saveSettings;

@end

