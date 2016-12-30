//
//  AddStructureViewController.h
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreen.h"
@interface AddStructureViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)NSArray* structuresArray;
@property(nonatomic, strong)NSArray* structCostArray;
@property (nonatomic,strong) UIButton* backToTabs;
@property(nonatomic, strong)NSMutableDictionary* selectedBuilding;

@end
