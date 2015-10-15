//
//  EmpListViewController.h
//  Employee Information
//
//  Created by Harish Singh on 14/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewEmployeeViewController.h"

@interface EmpListViewController : UIViewController <passEmployeeInfo> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *employeeListTableView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFilterEmpName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFilterEmpID;

@property (strong,nonatomic) NSMutableDictionary *empDetailedInfo;


@end
