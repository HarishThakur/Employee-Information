//
//  EmployeeInfoViewController.m
//  Employee Information
//
//  Created by Harish Singh on 06/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "EmployeeInfoViewController.h"
#import "ViewController.h"

@interface EmployeeInfoViewController ()

@end

@implementation EmployeeInfoViewController
{
    NSMutableArray *arrayForEmployeeDetails;
    NSObject *data;
    NSDictionary *tempDictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"VC intLabel: %ld", _intLabel);
    [self addEmployeeDetails];
    tempDictionary = [self getvalueAtIndex:_intLabel];
    
    _labelForEmployeeName.text = tempDictionary[@"name"];
    _labelForEmployeeID.text = tempDictionary[@"empId"];
    NSString *empDesignation = tempDictionary[@"designation"];
    NSString *empAddress = [empDesignation stringByAppendingString:@"  ||  "];
    NSString *empDesgAndAddress = [empAddress stringByAppendingString:tempDictionary[@"address"]];
    _labelForEmployeeDesignationAndAddress.text = empDesgAndAddress;
    UIImage *plate1 = [UIImage imageNamed:tempDictionary[@"image"]];
    [_imageOfEmployee setImage:plate1];
    //_imageOfEmployee.image = tempDictionary[@"image"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)getvalueAtIndex:(int)indexNumber
{
    NSLog(@"VC IndexNumber: %d", indexNumber);
    return [arrayForEmployeeDetails objectAtIndex:indexNumber];
}

/**
 *  Method to add employee deatils in a dictionary and add it to an array
 */
-(void)addEmployeeDetails {
    NSDictionary *employee1 = @{ @"name": @"John", @"empId": @"001", @"designation":@"iOS Developer", @"address":@"Bangalore", @"image":@"John.png"};
    NSDictionary *employee2 = @{ @"name": @"Shawn", @"empId": @"002", @"designation":@"Team Lead", @"address":@"Noida", @"image":@"Shawn"};
    NSDictionary *employee3 = @{ @"name": @"Peter", @"empId": @"003", @"designation":@"Android Developer", @"address":@"Chennai", @"image":@"Peter"};
    NSDictionary *employee4 = @{ @"name": @"Bob", @"empId": @"004", @"designation":@".Net Developer", @"address":@"Bangalore", @"image":@"Bob"};
    NSDictionary *employee5 = @{ @"name": @"Maria", @"empId": @"005", @"designation":@"Java Developer", @"address":@"Mumbai", @"image":@"Maria"};
    
    arrayForEmployeeDetails = [NSMutableArray array];
    [arrayForEmployeeDetails addObject:employee1];
    [arrayForEmployeeDetails addObject:employee2];
    [arrayForEmployeeDetails addObject:employee3];
    [arrayForEmployeeDetails addObject:employee4];
    [arrayForEmployeeDetails addObject:employee5];
}

@end
