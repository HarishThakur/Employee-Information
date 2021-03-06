//
//  EmpListViewController.m
//  Employee Information
//
//  Created by Harish Singh on 14/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "EmpListViewController.h"
#import "CustomTableViewCell.h"

@interface EmpListViewController (){
    NSMutableArray *tableData;
    NSMutableArray *thumbnails;
    NSString *currentRow;
    NSMutableDictionary *tempDictionaryForPassingEmpDetails;
    NSMutableArray *empDetailsInArray;
}


@end

@implementation EmpListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.employeeListTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.employeeListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CustomTableViewCell"];

    tableData = [[NSMutableArray alloc]init];
    thumbnails = [[NSMutableArray alloc]init];
    //empDetailsInArray = [[NSMutableArray alloc]init];

    
    self.employeeListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
     //[self.employeeListTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    cell.lbl.text = [tableData objectAtIndex:indexPath.row];
    
    cell.imgV.image = [UIImage imageNamed:@"no-image.png"];
    
    cell.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AddNewEmployeeViewController *vc = [[AddNewEmployeeViewController alloc] initWithNibName:@"AddNewEmployeeViewController" bundle:nil];
    //currentRow = [NSNumber numberWithInt:indexPath.row].integerValue;
    currentRow = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [self performSegueWithIdentifier:@"editEmployeeInfo" sender:self];
}

-(NSString*)getvalueAtIndex:(int)indexNumber
{
    return [empDetailsInArray objectAtIndex:indexNumber];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addEmployeeInfo"])
    {
        AddNewEmployeeViewController *viewCtrl = (AddNewEmployeeViewController*)[segue destinationViewController];
        viewCtrl.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"editEmployeeInfo"])
    {
        AddNewEmployeeViewController *viewCtrl = (AddNewEmployeeViewController*)[segue destinationViewController];
        viewCtrl.delegate = self;
        tempDictionaryForPassingEmpDetails = [self getvalueAtIndex:currentRow.integerValue];
        viewCtrl.passedInfo = tempDictionaryForPassingEmpDetails;
    }
}

-(void)viewWillAppear:(BOOL)animated {
    if([tableData count] == nil) {
        [_textFieldFilterEmpName setHidden:YES];
        [_textFieldFilterEmpID setHidden:YES];
        [self.filterButton setHidden:YES];
        [self.removeFilterButton setHidden:YES];
        [_labelFilterRecords setHidden:YES];
        _textFieldNotify.text = @"Tap [+] on the top to add new employee";
        
    }else {
        [_textFieldFilterEmpName setHidden:NO];
        [_textFieldFilterEmpID setHidden:NO];
        [self.filterButton setHidden:NO];
        [self.removeFilterButton setHidden:NO];
        [_textFieldNotify setHidden:YES];
        [_labelFilterRecords setHidden:NO];
    }

   [self.employeeListTableView reloadData];
}

- (IBAction)filterRecords:(id)sender {
    if(!([_textFieldFilterEmpName.text isEqualToString:@""] || [_textFieldFilterEmpID.text isEqualToString:@""])) {
        NSArray *filtered = [empDetailsInArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(name == %@) AND (empId==%@)", _textFieldFilterEmpName.text,_textFieldFilterEmpID.text]];
        NSLog(@"Filter: \n%@", filtered);
        [tableData removeAllObjects];
        NSArray *filteredNames = [filtered valueForKey:@"name"];
        [tableData addObjectsFromArray: filteredNames];
        [self.employeeListTableView reloadData];
    }
}

- (IBAction)removeFilterRecords:(id)sender {
    [tableData removeAllObjects];
    NSArray *allNames = [empDetailsInArray valueForKey:@"name"];
    [tableData addObjectsFromArray: allNames];
    [self.employeeListTableView reloadData];
}


-(void)setEmployeeInfo: (NSMutableDictionary*)employeeInfo {
    if([tableData count] == 0) {
        empDetailsInArray = [[NSMutableArray alloc]init];
    }
    _empDetailedInfo = employeeInfo;
    [tableData addObject:employeeInfo[@"name"]];
    
    [empDetailsInArray addObject:_empDetailedInfo];
}

-(void)editEmployeeInfo: (NSMutableDictionary*)employeeInfo {
    tableData[currentRow.integerValue] = employeeInfo[@"name"];
    
//    NSMutableDictionary *detailDict = [empDetailsInArray objectAtIndex:currentRow.integerValue];
//    
//    [detailDict setObject:[employeeInfo objectForKey:@"name"] forKey:@"name"];
//    [detailDict setObject:[employeeInfo objectForKey:@"empId"] forKey:@"empId"];
//    [detailDict setObject:[employeeInfo objectForKey:@"designation"] forKey:@"designation"];
//    [detailDict setObject:[employeeInfo objectForKey:@"address"] forKey:@"address"];
    
    
    //[self.employeeListTableView reloadRowsAtIndexPaths:<#(NSArray *)#> withRowAnimation:<#(UITableViewRowAnimation)#>]
    
}

@end
