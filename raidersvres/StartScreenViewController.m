//
//  StartScreenViewController.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import "StartScreenViewController.h"

@interface StartScreenViewController ()
{
    int residentCount;
    int citizenCount;
    int heroCount;
    int leaderCount;
    int farmerCount;
    int defenceCount;
}
@end

@implementation StartScreenViewController

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults* statDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* rc; //residents
    NSNumber* cc; //citizens
    NSNumber* fc; //farmers
    NSNumber* hc; //heroes
    NSNumber* lc; //leaders
    NSNumber* def;
    rc = [NSNumber numberWithInt:residentCount];
    cc = [NSNumber numberWithInt:citizenCount];
    fc = [NSNumber numberWithInt:farmerCount];
    lc = [NSNumber numberWithInt:leaderCount];
    hc = [NSNumber numberWithInt:heroCount];
    def = [NSNumber numberWithInt:defenceCount];
    
    [statDefaults setObject:rc forKey:@"ResidentCount"];
    [statDefaults setObject:cc forKey:@"CitizenCount"];
    [statDefaults setObject:fc forKey:@"FarmerCount"];
    [statDefaults setObject:lc forKey:@"LeaderCount"];
    [statDefaults setObject:hc forKey:@"HeroCount"];
    [statDefaults setObject:def forKey:@"DefenceTotal"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* _backGround = [UIImage imageNamed:@"realtitlescreen.png"];
    UIImageView* _backGroundView = [[UIImageView alloc] initWithImage:_backGround];
    
    _backGroundView.frame = self.view.frame;
    
    [self.view addSubview:_backGroundView];
    [self.view sendSubviewToBack:_backGroundView];
    // Do any additional setup after loading the view.
    

}
-(IBAction)startGame:(id)sender
{
    [self performSegueWithIdentifier:@"toGame" sender:self];
    
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
