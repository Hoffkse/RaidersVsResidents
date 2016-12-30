//
//  endGameViewController.h
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol endGameDelegate
-(void) endingTimer;
@end

@interface endGameViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic,strong) UIButton* endGame;

@end
