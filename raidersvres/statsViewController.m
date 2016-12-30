//
//  statsViewController.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/13/15.
//  Copyright (c) 2015 GroupProject. All rights reserved.
//

#import "statsViewController.h"
#import "MainScreen.h"

@interface statsViewController () 
{
    NSNumber* resCount;
    NSNumber* citCount;
    NSNumber* farmerCount;
    NSNumber* heroCount;
    NSNumber* leaderCount;
    NSNumber* defenceCount;
    NSNumber* charismaCount;
}
@end

@implementation statsViewController 

-(void) viewWillAppear:(BOOL)animated
{
    NSUserDefaults* sdefaults = [NSUserDefaults standardUserDefaults];
    resCount = [sdefaults objectForKey:@"ResidentCount"];
    citCount = [sdefaults objectForKey:@"CitizenCount"];
    farmerCount = [sdefaults objectForKey:@"FarmerCount"];
    heroCount = [sdefaults objectForKey:@"HeroCount"];
    leaderCount = [sdefaults objectForKey:@"LeaderCount"];
    defenceCount = [sdefaults objectForKey:@"DefenceTotal"];
    charismaCount = [sdefaults objectForKey:@"CharismaTotal"];
    
    self.citizenCountLabel.text = [NSString stringWithFormat:@"%@", citCount];
    self.residentCountLabel.text = [NSString stringWithFormat:@"%@", resCount];
    self.farmerCountLabel.text = [NSString stringWithFormat:@"%@", farmerCount];
    self.heroCountLabel.text = [NSString stringWithFormat:@"%@", heroCount];
    self.leaderCountLabel.text = [NSString stringWithFormat:@"%@", leaderCount];
    self.defenceCountLabel.text = [NSString stringWithFormat:@"%@", defenceCount];
    self.charismaCountLabel.text = [NSString stringWithFormat:@"%@", charismaCount];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* _backGround = [UIImage imageNamed:@"subtabbackground.png"];
    UIImageView* _backGroundView = [[UIImageView alloc] initWithImage:_backGround];
    
    _backGroundView.frame = self.view.frame;
    
    [self.view addSubview:_backGroundView];
    [self.view sendSubviewToBack:_backGroundView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
