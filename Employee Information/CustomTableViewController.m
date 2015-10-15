//
//  CustomTableViewController.m
//  Employee Information
//
//  Created by Harish Singh on 05/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomTableViewCell.h"
#import "ViewController.h"
#import "EmployeeInfoViewController.h"


@interface CustomTableViewController () {
    NSMutableArray *tableData;
    NSMutableArray *thumbnails;
    NSString *currentRow;
    ViewController *vc;
}

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];

    [self.sbtEmployeeListTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.sbtEmployeeListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CustomTableViewCell"];
    tableData = [NSMutableArray arrayWithObjects:@"John Marsh", @"Shawn Michaels", @"Peter Parker", @"Bob Pieterson", @"Maria Faulkner", @"Scarlett Thomas",@"Kitty Vincent",@"Trisha Roy", nil];
    thumbnails = [NSMutableArray arrayWithObjects:@"John.png", @"Shawn.png", @"Peter.png",@"Bob.png",@"Maria.png",@"Scarlett.png",@"Kitty.png",@"Trisha.png", nil];
        self.sbtEmployeeListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    cell.lbl.text = [tableData objectAtIndex:indexPath.row];
    if(indexPath.row >= 8)
    {
        cell.imgV.image = [UIImage imageNamed:@"no-image.png"];
    }
    else {
         cell.imgV.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    }
    cell.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    vc = [[ViewController alloc] initWithNibName:@"EmployeeInfoViewController" bundle:nil];
    currentRow = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [self performSegueWithIdentifier:@"showEmployeeDetails" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"showEmployeeDetails"]) {
        ViewController *viewCtrl = (ViewController*)[segue destinationViewController];
        viewCtrl.intIndexLabel = currentRow.integerValue;
        viewCtrl.getEmpInfo = _empDetailedInfo;
    }
    else if ([segue.identifier isEqualToString:@"addEmployeeInfo"])
    {
        AddNewEmployeeViewController *viewCtrl = (AddNewEmployeeViewController*)[segue destinationViewController];
        viewCtrl.delegate = self;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.sbtEmployeeListTableView reloadData];
}

#pragma mark - Protocol Methods

-(void)setEmployeeInfo: (NSMutableDictionary*)employeeInfo {
    _empDetailedInfo = employeeInfo;
    [tableData addObject:employeeInfo[@"name"]];
}

//-(void)setEmployeeName:(NSString*)employeeName{
//    _employeeName = employeeName;
//    //[tableData addObject:employeeName];
//}
//-(void)setEmployeeID:(NSString*)employeeID{
//    _employeeID = employeeID;
//}
//-(void)setDesignation:(NSString*)designation{
//    _designation = designation;
//}
//-(void)setAddress:(NSString*)address{
//    _address = address;
//}




@end
