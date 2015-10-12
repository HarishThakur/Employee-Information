//
//  EmployeeInfoViewController.m
//  Employee Information
//
//  Created by Harish Singh on 06/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "EmployeeInfoViewController.h"
#import "ViewController.h"
#import "NSDictionary+JSONResult.h"

@interface EmployeeInfoViewController ()

@end

@implementation EmployeeInfoViewController
{
    NSMutableArray *arrayForEmployeeDetails;
    NSObject *data;
    NSDictionary *tempDictionary;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];
    [super viewDidLoad];
    
    //NSLog(@"VC intLabel: %ld", _intLabel);
    [self addEmployeeDetails];
    tempDictionary = [self getvalueAtIndex:_intLabel];
    
    [NSDictionary getJSONResult:tempDictionary];
    
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
    //NSLog(@"VC IndexNumber: %d", indexNumber);
    return [arrayForEmployeeDetails objectAtIndex:indexNumber]; 
}



/**
 *  Method to add employee deatils in a dictionary and add it to an array
 */
-(void)addEmployeeDetails {
    NSDictionary *employee1 = @{ @"name": @"John Marsh", @"empId": @"001", @"designation":@"iOS Developer", @"address":@"Bangalore", @"image":@"John.png"};
    NSDictionary *employee2 = @{ @"name": @"Shawn Michaels", @"empId": @"002", @"designation":@"Team Lead", @"address":@"Noida", @"image":@"Shawn.png"};
    NSDictionary *employee3 = @{ @"name": @"Peter Parker", @"empId": @"003", @"designation":@"Android Developer", @"address":@"Chennai", @"image":@"Peter.png"};
    NSDictionary *employee4 = @{ @"name": @"Bob Pieterson", @"empId": @"004", @"designation":@".Net Developer", @"address":@"Bangalore", @"image":@"Bob.png"};
    NSDictionary *employee5 = @{ @"name": @"Maria Faulkner", @"empId": @"005", @"designation":@"Java Developer", @"address":@"Mumbai", @"image":@"Maria.png"};
    NSDictionary *employee6 = @{ @"name": @"Scarlett Thomas", @"empId": @"006", @"designation":@"IT Admin", @"address":@"Hyderabad", @"image":@"Scarlett.png"};
    NSDictionary *employee7 = @{ @"name": @"Kitty Vincent", @"empId": @"007", @"designation":@"HR Admin", @"address":@"Kerala", @"image":@"Kitty.png"};
    NSDictionary *employee8 = @{ @"name": @"Trisha Roy", @"empId": @"008", @"designation":@"iOS Developer", @"address":@"Madhya Pradesh", @"image":@"Trisha.png"};
    
    arrayForEmployeeDetails = [NSMutableArray array];
    
    [arrayForEmployeeDetails addObject:employee1];
    [arrayForEmployeeDetails addObject:employee2];
    [arrayForEmployeeDetails addObject:employee3];
    [arrayForEmployeeDetails addObject:employee4];
    [arrayForEmployeeDetails addObject:employee5];
    [arrayForEmployeeDetails addObject:employee6];
    [arrayForEmployeeDetails addObject:employee7];
    [arrayForEmployeeDetails addObject:employee8];
}

@end
