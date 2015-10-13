//
//  AddNewEmployeeViewController.m
//  Employee Information
//
//  Created by Harish Singh on 12/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "AddNewEmployeeViewController.h"

@interface AddNewEmployeeViewController () {
    UIImage *pickImage;
}

@end

@implementation AddNewEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImage:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:NO completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    pickImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = pickImage;
    
    //_setImageView = pickImage;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
//     _employeeName = _textFieldEmployeeName.text;
//    [[self delegate]setEmployeeName: _employeeName];
//    _employeeID = _textFieldEmployeeID.text;
//    [[self delegate]setEmployeeID: _employeeID];
//    _designation = _textFieldDesignation.text;
//    [[self delegate]setDesignation: _designation];
//    _address = _textFieldAddress.text;
//    [[self delegate]setAddress: _address];
    
    NSMutableDictionary *empPassedInfo = @{ @"name": [NSString stringWithFormat: _textFieldEmployeeName.text], @"empId": [NSString stringWithFormat: _textFieldEmployeeID.text], @"designation":[NSString stringWithFormat: _textFieldDesignation.text], @"address":[NSString stringWithFormat: _textFieldAddress.text], @"image":@"no-image.png"};
    
    [[self delegate]setEmployeeInfo: empPassedInfo];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
