//
//  AddNewEmployeeViewController.m
//  Employee Information
//
//  Created by Harish Singh on 12/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "AddNewEmployeeViewController.h"
#import "EmpListViewController.h"

@interface AddNewEmployeeViewController () {
    NSMutableDictionary *empPassedInfo;
}

@end

@implementation AddNewEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(_passedInfo != nil) {
        _textFieldEmployeeName.text = _passedInfo[@"name"];
        _textFieldEmployeeID.text = _passedInfo[@"empId"];
        _textFieldDesignation.text = _passedInfo[@"designation"];
        _textFieldAddress.text = _passedInfo[@"address"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)save:(id)sender {
    empPassedInfo = [[NSMutableDictionary alloc]init];
    
    [empPassedInfo setValue:[NSString stringWithFormat: _textFieldEmployeeName.text] forKey:@"name" ];
    [empPassedInfo setValue:[NSString stringWithFormat: _textFieldEmployeeID.text] forKey:@"empId" ];
    [empPassedInfo setValue:[NSString stringWithFormat: _textFieldDesignation.text] forKey:@"designation" ];
    [empPassedInfo setValue:[NSString stringWithFormat: _textFieldAddress.text] forKey:@"address" ];
    [empPassedInfo setValue:@"no-image.png" forKey:@"image" ];
    
    if(_passedInfo == nil) {
        [[self delegate]setEmployeeInfo: empPassedInfo];
    }
    else {
        [[self delegate]editEmployeeInfo: empPassedInfo];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
