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
    NSArray *tableData;
    NSArray *thumbnails;
    NSString *currentRow;
    ViewController *vc;
}

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"dark-wood-image.jpg"]];
    [super viewDidLoad];

    tableData = [NSArray arrayWithObjects:@"John Marsh", @"Shawn Michaels", @"Peter Parker", @"Bob Pieterson", @"Maria Faulkner", @"Scarlett Thomas",@"Kitty Vincent",@"Trisha Roy", nil];

    thumbnails = [NSArray arrayWithObjects:@"John.png", @"Shawn.png", @"Peter.png", @"Bob.png", @"Maria.png",@"Scarlett.png",@"Kitty.png",@"Trisha.png", nil];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CustomTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Main Cell"];
//    }
    
    // Configure the cell...
   cell.lbl.text = [tableData objectAtIndex:indexPath.row];
    cell.imgV.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    vc = [[ViewController alloc] initWithNibName:@"EmployeeInfoViewController" bundle:nil];
    currentRow = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    //NSLog(@"TVC current row %ld", currentRow.integerValue);
    [self performSegueWithIdentifier:@"showEmployeeDetails" sender:self];

}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if ([segue.identifier isEqualToString: @"showEmployeeDetails"]) {
            ViewController *viewCtrl = (ViewController*)[segue destinationViewController];
            viewCtrl.intIndexLabel = currentRow.integerValue;
            //NSLog(@"TVC intLabel: %ld", viewCtrl.intIndexLabel);
        }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
