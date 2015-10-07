//
//  EmployeeInfoViewController.h
//  Employee Information
//
//  Created by Harish Singh on 06/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelForEmployeeName;
@property (weak, nonatomic) IBOutlet UILabel *labelForEmployeeID;
@property (weak, nonatomic) IBOutlet UILabel *labelForEmployeeDesignationAndAddress;
@property (weak, nonatomic) IBOutlet UIImageView *imageOfEmployee;
@property NSInteger intLabel;
@end
