//
//  endGameViewController.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import "endGameViewController.h"

@interface endGameViewController ()
{
    int residentCount;
    int citizenCount;
    int heroCount;
    int leaderCount;
    int farmerCount;
    int defenceCount;
}
@end

@implementation endGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* _backGround = [UIImage imageNamed:@"endgame.png"];
    UIImageView* _backGroundView = [[UIImageView alloc] initWithImage:_backGround];
    
    _backGroundView.frame = self.view.frame;
    
    [self.view addSubview:_backGroundView];
    [self.view sendSubviewToBack:_backGroundView];

    // Do any additional setup after loading the view.
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //seleced to not quit
    }
    else if (buttonIndex == 1) {
        
        //[self.timerDelegate endingTimer];
                
        [self performSegueWithIdentifier:@"endedGame" sender:self];
        
        //need to delegate
    }
}

-(IBAction)endGame:(id)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Do you really want to quit the game?"
                                                    message:@"I MEAN REALLY?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"YES",nil];
    [alert show];
}
/*
 -(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 
 }
*/

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
