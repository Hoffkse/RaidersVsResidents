//
//  statsViewController.h
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/13/15.
//  Copyright (c) 2015 GroupProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreen.h"


@interface statsViewController : UIViewController 

@property (nonatomic, strong) IBOutlet UILabel* residentCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* citizenCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* farmerCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* heroCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* leaderCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* defenceCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* charismaCountLabel;
@property (nonatomic, strong) NSDictionary* transferDic;


@end
