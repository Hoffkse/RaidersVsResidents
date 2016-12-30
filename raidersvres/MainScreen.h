//
//  MainScreen.h
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "AddPersonViewController.h"


@interface MainScreen : UIViewController <UIGestureRecognizerDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) NSDictionary* transferPerson;
@property (nonatomic, strong) IBOutlet UILabel* coinLabel;
@property (nonatomic, strong) IBOutlet UILabel* notificationLabel;
@property (nonatomic, strong) NSDictionary* transferStructure;
@property (nonatomic, strong) IBOutlet UIButton* structButton;
@property (nonatomic, strong) IBOutlet UIButton* personButton;

@end
