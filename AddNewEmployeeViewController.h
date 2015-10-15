//
//  AddNewEmployeeViewController.h
//  Employee Information
//
//  Created by Harish Singh on 12/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol passEmployeeInfo <NSObject>

-(void)setEmployeeInfo: (NSMutableDictionary*)employeeInfo;
-(void)editEmployeeInfo: (NSMutableDictionary*)employeeInfo;

@end

@interface AddNewEmployeeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldEmployeeName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmployeeID;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDesignation;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@property (weak,nonatomic) id <passEmployeeInfo> delegate;
@property (strong,nonatomic) NSMutableDictionary *passedInfo;

@property NSInteger intIndexLabel;


@end
