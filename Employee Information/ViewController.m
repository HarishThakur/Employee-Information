//
//  ViewController.m
//  Employee Information
//
//  Created by Harish Singh on 05/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeInfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *arrayForEmployeeDetails;
    NSObject *data;
    NSDictionary *tempDictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"showEpmloyeeInfo"]) {
        EmployeeInfoViewController *viewCtrl = (EmployeeInfoViewController *)[segue destinationViewController];
        viewCtrl.intLabel = _intIndexLabel;
        NSLog(@"VC intLabel: %ld", viewCtrl.intLabel);
    }
}
@end
