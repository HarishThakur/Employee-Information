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

        [self addObserver:self forKeyPath:@"passedInfo.name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"passedInfo.empId" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"passedInfo.designation" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"passedInfo.address" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self removeObserver:self forKeyPath:@"passedInfo.name" context:nil];
    [self removeObserver:self forKeyPath:@"passedInfo.empId" context:nil];
    [self removeObserver:self forKeyPath:@"passedInfo.designation" context:nil];
    [self removeObserver:self forKeyPath:@"passedInfo.address" context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"passedInfo.name"]) {
        NSLog(@"The name of the emp was changed.\n");
        NSLog(@"%@", change);
        
    }
    if ([keyPath isEqualToString:@"passedInfo.designation"]) {
        NSLog(@"The designation of the emp was changed.\n");
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"passedInfo.empId"]) {
        NSLog(@"The EmpId of the emp was changed.\n");
        NSLog(@"%@", change);
    }
    if ([keyPath isEqualToString:@"passedInfo.address"]) {
        NSLog(@"The address of the emp was changed.\n");
        NSLog(@"%@", change);
    }
}

- (IBAction)save:(id)sender {
    empPassedInfo = [[NSMutableDictionary alloc]init];
    
    [empPassedInfo setValue:[NSString stringWithFormat:@"%@", _textFieldEmployeeName.text] forKey:@"name" ];
    [empPassedInfo setValue:[NSString stringWithFormat:@"%@",_textFieldEmployeeID.text] forKey:@"empId" ];
    [empPassedInfo setValue:[NSString stringWithFormat: @"%@",_textFieldDesignation.text] forKey:@"designation" ];
    [empPassedInfo setValue:[NSString stringWithFormat:@"%@", _textFieldAddress.text] forKey:@"address" ];
    [empPassedInfo setValue:@"no-image.png" forKey:@"image" ];
    
    if(_passedInfo == nil) {
        [[self delegate]setEmployeeInfo: empPassedInfo];
    }
    else {
        if(!([self.passedInfo[@"name"] isEqualToString: empPassedInfo[@"name"] ])) {
            [self.passedInfo setValue:empPassedInfo[@"name"] forKey:@"name"];
        }
        if(!([self.passedInfo[@"empId"] isEqualToString: empPassedInfo[@"empId"] ])) {
            [self.passedInfo setValue:empPassedInfo[@"empId"] forKey:@"empId"];
        }
        if(!([self.passedInfo[@"designation"] isEqualToString: empPassedInfo[@"designation"] ])) {
            [self.passedInfo setValue:empPassedInfo[@"designation"] forKey:@"designation"];
        }
        if(!([self.passedInfo[@"address"] isEqualToString: empPassedInfo[@"address"] ])) {
            [self.passedInfo setValue:empPassedInfo[@"address"] forKey:@"address"];
        }
        
      [[self delegate]editEmployeeInfo: empPassedInfo];
        
        [self removeObserver:self forKeyPath:@"passedInfo.name" context:nil];
        [self removeObserver:self forKeyPath:@"passedInfo.empId" context:nil];
        [self removeObserver:self forKeyPath:@"passedInfo.designation" context:nil];
        [self removeObserver:self forKeyPath:@"passedInfo.address" context:nil];
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
