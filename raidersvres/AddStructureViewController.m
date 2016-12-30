//
//  AddStructureViewController.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import "AddStructureViewController.h"
#import "MainScreen.h"

@interface AddStructureViewController ()

@end

@implementation AddStructureViewController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mystyle"];
    cell.textLabel.text = [self.structuresArray objectAtIndex:indexPath.row];
    if ([cell.textLabel.text  isEqual: @"House"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +3 Defence" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Pub"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +10 Coins" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Farm"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +20 Coins" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Barracks"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +10 Defence" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
       else if ([cell.textLabel.text  isEqual: @"Wall"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +15 Defence" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
    else if ([cell.textLabel.text  isEqual: @"Town Center"])
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ : +5 Charisma, +50 Coins" ,[self.structCostArray objectAtIndex:indexPath.row]];
    }
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.structuresArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedBuilding = [self.structuresArray objectAtIndex:indexPath.row];
    NSLog(@"%@", self.structuresArray);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fifthViewSubmit"
                                                        object:self
                                                      userInfo:self.selectedBuilding];
    [self dismissViewControllerAnimated:true completion:nil];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.structuresArray = [[NSArray alloc] initWithObjects: @"House", @"Pub", @"Farm", @"Barracks", @"Wall", @"Town Center", nil];
    self.structCostArray = [[NSArray alloc] initWithObjects: @"200", @"400", @"700", @"800", @"1000", @"1250", nil];
}

-(IBAction)backToTabs:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
