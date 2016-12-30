//
//  AddPersonViewController.h
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreen.h"


@interface AddPersonViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)NSArray* peopleArray;
@property(nonatomic, strong)NSArray* peopleCostArray;
@property (nonatomic,strong) UIButton* backToTabs;
@property(nonatomic, strong)NSMutableDictionary* selectedPerson;

@end
