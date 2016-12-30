//
//  AddPersonViewController.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import "AddPersonViewController.h"
#import "MainScreen.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mystyle"];
    cell.textLabel.text = [self.peopleArray objectAtIndex:indexPath.row];
    if ([cell.textLabel.text  isEqual: @"Citizen"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +1 Defence" ,[self.peopleCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Farmer"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +2 Defence" ,[self.peopleCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Leader"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +1 Charisma" ,[self.peopleCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Hero"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +3 Defence" ,[self.peopleCostArray objectAtIndex:indexPath.row]];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.peopleArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedPerson = [self.peopleArray objectAtIndex:indexPath.row];
    NSLog(@"%@", self.selectedPerson);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fourthViewSubmit"
                                                        object:self
                                                      userInfo:self.selectedPerson];
    [self dismissViewControllerAnimated:true completion:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.peopleArray = [[NSArray alloc] initWithObjects: @"Citizen", @"Farmer", @"Hero", @"Leader", nil];
    self.peopleCostArray = [[NSArray alloc] initWithObjects: @"100", @"175", @"250", @"425", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)backToTabs:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedCollege = [self.collegeArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"collegeTouchedSegue" sender:self];
    
}
*/
@end
