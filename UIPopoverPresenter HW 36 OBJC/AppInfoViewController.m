//
//  AppInfoViewController.m
//  UIPopoverPresenter HW 36 OBJC
//
//  Created by Marentilo on 10.03.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

#import "AppInfoViewController.h"

@interface AppInfoViewController ()

@end

@implementation AppInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 150, 50)];
    label1.text = @"Popover about app";
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 120, 150, 50)];
    label2.text = @"Version 1.0";
    [view addSubview:label1];
    [view addSubview:label2];
    
    [self.view addSubview:view];
    self.view.backgroundColor = UIColor.blueColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
