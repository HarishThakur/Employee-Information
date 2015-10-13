//
//  CustomTableViewController.h
//  Employee Information
//
//  Created by Harish Singh on 05/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewEmployeeViewController.h"



@interface CustomTableViewController : UITableViewController <passEmployeeInfo>

//@property (strong,nonatomic) NSString *employeeName;
//@property (strong,nonatomic) NSString *employeeID;
//@property (strong,nonatomic) NSString *designation;
//@property (strong,nonatomic) NSString *address;

@property (strong,nonatomic) NSMutableDictionary *empDetailedInfo;

@end
