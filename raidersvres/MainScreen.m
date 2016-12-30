//
//  MainScreen.m
//  raidersvres
//
//  Created by Jon Hollan, Mark Hoffman, Brandon Ball on 12/6/15.
//  Copyright © 2015 GroupProject. All rights reserved.
//

#import "MainScreen.h"
#import "statsViewController.h"



@interface MainScreen ()
{
    int coins;
    NSTimer* _secondTimer;
    int second;
    int combatTimer;
    int combatWarningTimer;
    int doOnce;
    
    int round;
    int raiderStrength;
    BOOL answer;
    BOOL answer2;
    BOOL answer3;
    BOOL answer4;
    BOOL answer5;
    BOOL answer6;
    BOOL answer7;
    BOOL townCenterFound;
    BOOL farmFound;
    BOOL barrackFound;
    BOOL pubFound;
    BOOL wallFound;
    BOOL houseFound;
    int residentCount;
    int citizenCount;
    int heroCount;
    int leaderCount;
    int farmerCount;
    int defenceCount;
    int coinBonus;
    int charismaCount;
    BOOL notEnoughCoins;
    BOOL onlyOnce;
    BOOL townCenterCoinBonus;
    BOOL farmCoinBonus;
    BOOL pubCoinBonus;
}


@property (nonatomic, strong) UIView* myView;
@property(nonatomic,strong) NSString* person;
@property (nonatomic, strong) UIView* towncenter;
@property (nonatomic, strong) UIView* pub;
@property (nonatomic, strong) UIView* farm;
@property (nonatomic, strong) UIView* barracks;
@property (nonatomic, strong) UIView* house;
@property (nonatomic, strong) UIView* wall;
@property (nonatomic, strong) UIView* wall2;
@property (nonatomic, strong) UIView* citizenUIView1;
@property (nonatomic, strong) UIView* citizenUIView2;
@property (nonatomic, strong) UIView* citizenUIView3;
@property (nonatomic, strong) UIView* citizenUIView4;
@property (nonatomic, strong) UIView* citizenUIView5;
@property (nonatomic, strong) UIView* citizenUIView6;
@property (nonatomic, strong) UIView* citizenUIView7;
@property (nonatomic, strong) UIView* yellowHoard;
@property (nonatomic, strong) UIView* greenHoard;
@property (nonatomic, strong) UIView* redHoard;
@property (nonatomic, strong) UIView* fullHeartUiView;
@property (nonatomic, strong) UIView* lossOneHeartUIView;
@property (nonatomic, strong) UIView* lossTwoHeartUIView;
@property (nonatomic, strong) UIView* lossThreeHeartUIView;
@property (assign) CGRect yellowHoardRect;
@property (assign) CGRect greenHoardRect;
@property (assign) CGRect redHoardRect;
@property (assign) CGRect fullHeart;
@property (assign) CGRect lossOneHeart;
@property (assign) CGRect lossTwoHeart;
@property (assign) CGRect lossthreeHeart;
@property (assign) CGRect citizenZone1;
@property (assign) CGRect citizenZone2;
@property (assign) CGRect citizenZone3;
@property (assign) CGRect citizenZone4;
@property (assign) CGRect citizenZone5;
@property (assign) CGRect citizenZone6;
@property (assign) CGRect citizenZone7;
@property (assign) CGRect animationTest;
@property (assign) NSInteger heartCount;



@end

@implementation MainScreen

- (void)viewDidLoad {
    
    [super viewDidLoad];
    if (!onlyOnce)
    {
        self.heartCount = 3;
        onlyOnce = true;
    }

    if (self.heartCount == 3)
    {
        UIImage* heartFull = [UIImage imageNamed:@"fullheart.png"];
        UIImageView* fullHeartView = [[UIImageView alloc]initWithImage:heartFull];
        self.fullHeart = CGRectMake(7, 78, heartFull.size.width, heartFull.size.height);
        self.fullHeartUiView = [[UIView alloc] initWithFrame:self.fullHeart];
        [self.fullHeartUiView addSubview:fullHeartView];
        [self.view addSubview:self.fullHeartUiView];
    }

    
    UIImage* citizenZoneImg = [UIImage imageNamed: @"citizenZone.png"];
    UIImage* citizenZoneImgSmall = [UIImage imageNamed:@"citizenzonesmall.png"];
    //UIImage* yellowHoard = [UIImage imageNamed:@"yellowhoard.png"];
    //UIImageView* yellowHoardView = [[UIImageView alloc]initWithImage:yellowHoard];
    UIImageView* citizenZoneView1 = [[UIImageView alloc]initWithImage:citizenZoneImgSmall];
    UIImageView* citizenZoneView2 = [[UIImageView alloc]initWithImage:citizenZoneImg];
    UIImageView* citizenZoneView3 = [[UIImageView alloc]initWithImage:citizenZoneImg];
    UIImageView* citizenZoneView4 = [[UIImageView alloc]initWithImage:citizenZoneImg];
    UIImageView* citizenZoneView5 = [[UIImageView alloc]initWithImage:citizenZoneImg];
    UIImageView* citizenZoneView6 = [[UIImageView alloc]initWithImage:citizenZoneImgSmall];
    UIImageView* citizenZoneView7 = [[UIImageView alloc]initWithImage:citizenZoneImgSmall];

    citizenZoneView1.alpha = 0.5;
    citizenZoneView2.alpha = 0.5;
    citizenZoneView3.alpha = 0.5;
    citizenZoneView4.alpha = 0.5;
    citizenZoneView5.alpha = 0.5;
    citizenZoneView6.alpha = 0.5;
    citizenZoneView7.alpha = 0.5;
    
    //self.yellowHoardRect = CGRectMake(70, 530, yellowHoard.size.width, yellowHoard.size.height);
    self.citizenZone1 = CGRectMake(70, 264, citizenZoneImg.size.width, citizenZoneImg.size.height);
    self.citizenZone2 = CGRectMake(74, 415, citizenZoneImg.size.width,citizenZoneImg.size.height);
    self.citizenZone3 = CGRectMake(247, 415, citizenZoneImg.size.width,citizenZoneImg.size.height);
    self.citizenZone4 = CGRectMake(58, 116, citizenZoneImg.size.width,citizenZoneImg.size.height);
    self.citizenZone5 = CGRectMake(255, 116, citizenZoneImg.size.width,citizenZoneImg.size.height);
    self.citizenZone6 = CGRectMake(260, 264, citizenZoneImg.size.width,citizenZoneImg.size.height);
    self.citizenZone7 = CGRectMake(165, 140, citizenZoneImg.size.width,citizenZoneImg.size.height);
    
    //self.yellowHoard = [[UIView alloc] initWithFrame:self.yellowHoardRect];
    self.citizenUIView1 = [[UIView alloc] initWithFrame:self.citizenZone1];
    self.citizenUIView2 = [[UIView alloc] initWithFrame:self.citizenZone2];
    self.citizenUIView3 = [[UIView alloc] initWithFrame:self.citizenZone3];
    self.citizenUIView4 = [[UIView alloc] initWithFrame:self.citizenZone4];
    self.citizenUIView5 = [[UIView alloc] initWithFrame:self.citizenZone5];
    self.citizenUIView6 = [[UIView alloc] initWithFrame:self.citizenZone6];
    self.citizenUIView7 = [[UIView alloc] initWithFrame:self.citizenZone7];
    
    //[self.yellowHoard addSubview:yellowHoardView];
    [self.citizenUIView1 addSubview:citizenZoneView1];
    [self.citizenUIView2 addSubview:citizenZoneView2];
    [self.citizenUIView3 addSubview:citizenZoneView3];
    [self.citizenUIView4 addSubview:citizenZoneView4];
    [self.citizenUIView5 addSubview:citizenZoneView5];
    [self.citizenUIView6 addSubview:citizenZoneView6];
    [self.citizenUIView7 addSubview:citizenZoneView7];
    
    //[self.view addSubview:self.yellowHoard];
    
    
    UIImage* _backGround = [UIImage imageNamed:@"background.png"];
    UIImageView* _backGroundView = [[UIImageView alloc] initWithImage:_backGround];

    _backGroundView.frame = self.view.frame;
    
    [self.view addSubview:_backGroundView];
    [self.view sendSubviewToBack:_backGroundView];

    doOnce++;
    NSLog(@"%i",doOnce);
    if (doOnce == 1) {

        NSLog(@"viewDidAppear");
        _secondTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(thisIsASecond) userInfo:nil repeats:YES];
        
        self.coinLabel.text =[NSString stringWithFormat:@"%i", coins];
    }
    
    
    NSLog(@"initializing coins.... %i", coins);
    coins = coins + 3000;
    self.coinLabel.text = [NSString stringWithFormat:@"%i",coins];
   
    
    
    UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)];
    [[self view] addGestureRecognizer:rec];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePersonSelected:)
                                                 name:@"fourthViewSubmit"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleBuildingSelected:)
                                                 name:@"fifthViewSubmit"
                                               object:nil];
    
    
}
-(BOOL)isPoint:(CGPoint)point insideOfRect:(CGRect)rect
{
    if ( CGRectContainsPoint(rect,point))
        return  YES;// inside
    else
        return  NO;// outside
}
-(void) viewDidAppear:(BOOL)animated
{
    
}

-(void) labelNotificationAnimation
{
    self.notificationLabel.alpha = 0.0;
    [UIView animateWithDuration:.7
                          delay:0.25
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.notificationLabel.alpha = 1.0;
                         self.notificationLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
                         self.notificationLabel.opaque = YES;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:.7
                                               delay:.37
                                             options: UIViewAnimationCurveEaseOut
                                          animations:^{
                                              self.notificationLabel.alpha = 0.0;
                                              
                                          }
                                          completion:^(BOOL finished){
                                              NSLog(@"Done!");
                                          }];
                     }];
}

- (void)handlePersonSelected:(NSNotification *)personNotification {
    NSUserDefaults* statDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* rc; //residents
    NSNumber* cc; //citizens
    NSNumber* fc; //farmers
    NSNumber* hc; //heroes
    NSNumber* lc; //leaders
    NSNumber* def; //defence
    NSNumber* chr;
    self.transferPerson = [personNotification userInfo];
    if (([self.transferPerson isEqual:@"Citizen"] && coins >= 100))
    {
        citizenCount = citizenCount + 1;
        residentCount++;
        coins = coins - 100;
        notEnoughCoins = true;
        defenceCount = defenceCount + 1;
    }
    else if (([self.transferPerson isEqual:@"Farmer"] && coins >= 175))
    {
        farmerCount = farmerCount + 1;
        residentCount++;
        coins = coins - 175;
        notEnoughCoins = true;
        defenceCount = defenceCount + 2;
    }
    else if (([self.transferPerson isEqual:@"Leader"] && coins >= 425))
    {
        leaderCount = leaderCount + 1;
        residentCount++;
        coins = coins - 425;
        notEnoughCoins = true;
        charismaCount = charismaCount + 1;
        

    }
    else if (([self.transferPerson isEqual:@"Hero"] && coins >= 250))
    {
        heroCount = heroCount + 1;
        residentCount++;
        coins = coins - 250;
        notEnoughCoins = true;
        defenceCount = defenceCount + 3;
    }
    else
    {
        notEnoughCoins = FALSE;
        self.notificationLabel.text = @"                     Not enough coins";
        [self labelNotificationAnimation];
        self.transferPerson = NULL;
        
    }
    
    if (notEnoughCoins)
    {
        self.citizenUIView1.alpha = 1.0;
        self.citizenUIView2.alpha = 1.0;
        self.citizenUIView3.alpha = 1.0;
        self.citizenUIView4.alpha = 1.0;
        self.citizenUIView5.alpha = 1.0;
        self.citizenUIView6.alpha = 1.0;
        self.citizenUIView7.alpha = 1.0;
    
        [self.view addSubview:self.citizenUIView1];
        [self.view addSubview:self.citizenUIView2];
        [self.view addSubview:self.citizenUIView3];
        [self.view addSubview:self.citizenUIView4];
        [self.view addSubview:self.citizenUIView5];
        [self.view addSubview:self.citizenUIView6];
        [self.view addSubview:self.citizenUIView7];
        
    }
    rc = [NSNumber numberWithInt:residentCount];
    cc = [NSNumber numberWithInt:citizenCount];
    fc = [NSNumber numberWithInt:farmerCount];
    lc = [NSNumber numberWithInt:leaderCount];
    hc = [NSNumber numberWithInt:heroCount];
    def = [NSNumber numberWithInt:defenceCount];
    chr = [NSNumber numberWithInt:charismaCount];
    
    [statDefaults setObject:rc forKey:@"ResidentCount"];
    [statDefaults setObject:cc forKey:@"CitizenCount"];
    [statDefaults setObject:fc forKey:@"FarmerCount"];
    [statDefaults setObject:lc forKey:@"LeaderCount"];
    [statDefaults setObject:hc forKey:@"HeroCount"];
    [statDefaults setObject:def forKey:@"DefenceTotal"];
    [statDefaults setObject:chr forKey:@"CharismaTotal"];
    
}

-(void)handleBuildingSelected:(NSNotification *)buildingNotification
{
    self.transferStructure = [buildingNotification userInfo];
    NSLog(@"%@", self.transferStructure);
    NSUserDefaults* statDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* def;
    NSNumber* chr;
    if ([self.transferStructure  isEqual: @"Town Center"])
    {
        if (coins < 1250)
        {
            self.notificationLabel.text = @"                     Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (townCenterFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 1250 && !townCenterFound)
        {
            coins = coins - 1250;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"towncenter.png"];
            CGRect townCenterFrame = CGRectMake(153, 200, img.size.width, img.size.height);
            self.towncenter = [[UIView alloc] initWithFrame:townCenterFrame];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            [self.towncenter addSubview:picView];
            [self.view addSubview:self.towncenter];
            townCenterFound = true;
            townCenterCoinBonus = true;
            charismaCount = charismaCount + 5;
            self.notificationLabel.text = @"Town center built! +5 charisma / +50 coin gain!";
            [self labelNotificationAnimation];
        }
        
    }
    else if ([self.transferStructure  isEqual: @"Pub"])
    {
        if (coins < 400)
        {
            self.notificationLabel.text = @"                      Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (pubFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 400 && !pubFound)
        {
            coins = coins - 400;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"b1.png"];
            CGRect pubFrame = CGRectMake(65, 200, img.size.width, img.size.height);
            self.pub = [[UIView alloc] initWithFrame:pubFrame];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            [self.pub addSubview:picView];
            [self.view addSubview:self.pub];
            pubFound = true;
            
            self.notificationLabel.text = @"A pub was created! Coin gain boosted by 10!";
            [self labelNotificationAnimation];
            
        }
      

    }
    else if ([self.transferStructure  isEqual: @"Farm"])
    {
        if (coins < 700)
        {
            self.notificationLabel.text = @"                     Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }if (farmFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 700 && !farmFound)
        {
            coins = coins - 700;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"farm.png"];
            CGRect farmFrame = CGRectMake(260, 180, img.size.width, img.size.height);
            self.farm = [[UIView alloc] initWithFrame:farmFrame];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            [self.farm addSubview:picView];
            [self.view addSubview:self.farm];
            farmFound = true;
            farmCoinBonus = true;
            self.notificationLabel.text = @"A farm was created! Coin gain boosted by 20!";
            [self labelNotificationAnimation];

        }
        
        
    }
    else if ([self.transferStructure  isEqual: @"Barracks"])
    {
        if (coins < 800)
        {
            self.notificationLabel.text = @"                     Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (barrackFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 800 && !barrackFound)
        {
            coins = coins - 800;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"barracks.png"];
            CGRect barracksFrame = CGRectMake(80, 325, img.size.width, img.size.height);
            self.barracks = [[UIView alloc] initWithFrame:barracksFrame];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            [self.barracks addSubview:picView];
            [self.view addSubview:self.barracks];
            barrackFound = true;
            defenceCount = defenceCount + 10;
            self.notificationLabel.text = @"         Barracks has been built! +10 Def!";
            [self labelNotificationAnimation];
        }
        
        
    }
    else if ([self.transferStructure  isEqual: @"House"])
    {
        if (coins < 200)
        {
            self.notificationLabel.text = @"                     Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (houseFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 200 && !houseFound)
        {
            coins = coins - 200;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"house.png"];
            CGRect houseFrame = CGRectMake(245, 320, img.size.width, img.size.height);
            self.house = [[UIView alloc] initWithFrame:houseFrame];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            [self.house addSubview:picView];
            [self.view addSubview:self.house];
            houseFound = true;
            defenceCount = defenceCount + 3;
            self.notificationLabel.text = @" Hospitality has boosted coins gained by 10!";
            [self labelNotificationAnimation];
        }
        
        
    }
    else if ([self.transferStructure  isEqual: @"Wall"])
    {
        if (coins < 1000)
        {
            self.notificationLabel.text = @"                     Not enough coins";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (wallFound)
        {
            self.notificationLabel.text = @"          You already have that structure!";
            [self labelNotificationAnimation];
            self.transferStructure = NULL;
        }
        if (coins >= 1000 && !wallFound)
        {
            coins = coins - 1000;
            self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
            UIImage *img = [UIImage imageNamed:@"wall.png"];
            CGRect wallFrame = CGRectMake(207, 500, img.size.width, img.size.height);
            CGRect wallFrame2 = CGRectMake(-15, 500, img.size.width, img.size.height);
            self.wall = [[UIView alloc] initWithFrame:wallFrame];
            self.wall2 = [[UIView alloc] initWithFrame:wallFrame2];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            UIImageView* picView2 = [[UIImageView alloc]initWithImage:img];
            [self.wall addSubview:picView];
            [self.wall2 addSubview:picView2];
            [self.view addSubview:self.wall2];
            [self.view addSubview:self.wall];
            wallFound = true;
            defenceCount = defenceCount + 15;
            self.notificationLabel.text = @"       Wall fortification has begun! +30 Def!";
            [self labelNotificationAnimation];
            
        }
        
    }
    
    def = [NSNumber numberWithInt:defenceCount];
    chr = [NSNumber numberWithInt:charismaCount];
    [statDefaults setObject:chr forKey:@"CharismaTotal"];
    [statDefaults setObject:def forKey:@"DefenceTotal"];
}

- (void)tapRecognized:(UITapGestureRecognizer *)recognizer
{
    if (self.transferPerson == NULL)
    {
        
    }
    if(recognizer.state == UIGestureRecognizerStateRecognized && self.transferPerson != NULL)
    {
        self.coinLabel.text = [NSString stringWithFormat:@"%i", coins];
        CGPoint point = [recognizer locationInView:recognizer.view];
        NSLog(@"point x: %f, point y: %f", point.x, point.y);
        answer = [self isPoint:point insideOfRect:self.citizenZone1];
        answer2 = [self isPoint:point insideOfRect:self.citizenZone2];
        answer3 = [self isPoint:point insideOfRect:self.citizenZone3];
        answer4 = [self isPoint:point insideOfRect:self.citizenZone4];
        answer5 = [self isPoint:point insideOfRect:self.citizenZone5];
        answer6 = [self isPoint:point insideOfRect:self.citizenZone6];
        answer7 = [self isPoint:point insideOfRect:self.citizenZone7];
        CGRect animationTest = self.view.frame;
        animationTest.origin.y += 400;
        animationTest.origin.x += 150;
        
        if (answer || answer2 || answer3 || answer4 || answer5 || answer6 || answer7)
        {
            NSLog(@"you picked a right spot");
            if ([self.transferPerson isEqual:@"Hero"])
            {
                
            }
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", self.transferPerson]];
            UIImageView* picView = [[UIImageView alloc]initWithImage:img];
            CGRect frame = CGRectMake(point.x - 20,point.y - 15, img.size.width, img.size.height);
            
            self.myView = [[UIView alloc]initWithFrame:frame ];
            [self.myView addSubview:picView];
            [self.view addSubview:self.myView];
            if ([self.transferPerson isEqual:@"Hero"])
            {
                self.notificationLabel.text = @"   A hero has arrived at your town! +3 Def!";
                [self labelNotificationAnimation];
            }
            else if ([self.transferPerson isEqual:@"Citizen"])
            {
                self.notificationLabel.text = @"A citizen has migrated to your town! +1 Def!";
                [self labelNotificationAnimation];
            }
            else if ([self.transferPerson isEqual:@"Farmer"])
            {
                self.notificationLabel.text = @"A farmer has begun harvesting in town! +2 Def!";
                [self labelNotificationAnimation];
            }
            else if ([self.transferPerson isEqual:@"Leader"])
            {
                self.notificationLabel.text = @"  A leader is providing guidance! +1 Charisma!";
                [self labelNotificationAnimation];
            }
        
            /*[UIView animateWithDuration:1.0
                                  delay:0.1
                                  options:UIViewAnimationOptionCurveEaseInOut
                                  animations:^{self.myView.frame = animationTest;}
                                  completion:^(BOOL finished){[UIView animateWithDuration:1.0
                                                                               animations:^{
                                                                                   self.myView.alpha = 0.0;}   // fade out
                                                                               completion:nil
                                                               ];}];*/
           
            [UIView animateWithDuration:0.4
                             animations:^{self.citizenUIView1.alpha = 0.0, self.citizenUIView2.alpha = 0.0, self.citizenUIView3.alpha = 0.0, self.citizenUIView4 .alpha = 0.0, self.citizenUIView5.alpha = 0.0, self.citizenUIView6.alpha = 0.0, self.citizenUIView7.alpha = 0.0;}
                             completion:^(BOOL finished){}];
            self.transferPerson = NULL;
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"Cannot Add a Resident here!"
                                  message: @"Tap within highlighted areas to correctly add your Resident"
                                  delegate: nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
            [alert show];

        }
    }
}
-(void) combatWarning
{
    //disable ui
    self.structButton.enabled = false;
    self.personButton.enabled = false;
    //update round
    round++;
    NSLog(@"round is: %i",round);
    //flash warning
    //self.notificationLabel.text =[NSString stringWithFormat:@"ENEMY RAIDERS APPROACHING!!!"];
    //[self labelNotificationAnimation];
    self.notificationLabel.text = [NSString stringWithFormat:@"RAIDER ROUND: %i", round];
    [self labelNotificationAnimation];
}
-(void) combat
{

    if (round < 3)
    {
        //get strength, line below makes random num between 0 and ten
        raiderStrength = arc4random() % 18;
        if (leaderCount >= 1)
        {
            int modifier;
            modifier = leaderCount;
            raiderStrength = raiderStrength - modifier;
        }
        
        //add monsters
        UIImage* greenHoard = [UIImage imageNamed:@"greenhoard.png"];
        UIImageView* greenHoardView = [[UIImageView alloc]initWithImage:greenHoard];
        self.greenHoardRect = CGRectMake(175, 580, greenHoard.size.width, greenHoard.size.height);
        self.greenHoard = [[UIView alloc] initWithFrame:self.greenHoardRect];
        [self.greenHoard addSubview:greenHoardView];
        [self.view addSubview:self.greenHoard];
        if (raiderStrength > defenceCount)
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"The raiders have won the battle.."];
            [self labelNotificationAnimation];
            self.heartCount = self.heartCount - 1;
            if (self.heartCount == 2 )
            {
                UIImage* heartLossOne = [UIImage imageNamed:@"lossone.png"];
                UIImageView* lossOneHeartView = [[UIImageView alloc]initWithImage:heartLossOne];
                self.lossOneHeart = CGRectMake(7, 78, heartLossOne.size.width, heartLossOne.size.height);
                self.lossOneHeartUIView = [[UIView alloc] initWithFrame:self.lossOneHeart];
                [self.lossOneHeartUIView addSubview:lossOneHeartView];
                [self.view addSubview:self.lossOneHeartUIView];
            }
            else if (self.heartCount == 1)
            {
                UIImage* heartLossTwo = [UIImage imageNamed:@"losstwo.png"];
                UIImageView* lossTwoHeartView = [[UIImageView alloc]initWithImage:heartLossTwo];
                self.lossTwoHeart = CGRectMake(7, 78, heartLossTwo.size.width, heartLossTwo.size.height);
                self.lossTwoHeartUIView = [[UIView alloc] initWithFrame:self.lossTwoHeart];
                [self.lossTwoHeartUIView addSubview:lossTwoHeartView];
                [self.view addSubview:self.lossTwoHeartUIView];
            }
            else if (self.heartCount == 0)
            {
                UIImage* heartLossThree = [UIImage imageNamed:@"lossthree.png"];
                UIImageView* lossThreeHeartView = [[UIImageView alloc]initWithImage:heartLossThree];
                self.lossthreeHeart = CGRectMake(7, 78, heartLossThree.size.width, heartLossThree.size.height);
                self.lossThreeHeartUIView = [[UIView alloc] initWithFrame:self.lossthreeHeart];
                [self.lossThreeHeartUIView addSubview:lossThreeHeartView];
                [self.view addSubview:self.lossThreeHeartUIView];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have ran out of hearts!"
                                                                message:@"GAME OVER "
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK",nil];
                [alert show];
                
                
            }
            
        }
        else
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"You have fended off the raiders!"];
            [self labelNotificationAnimation];
            coins = coins + 100;
        }
    }
    
    else if (round >= 3 && round < 5)
    {
        raiderStrength = arc4random() % 50;
        //add monsters
        if (leaderCount >= 1)
        {
            int modifier;
            modifier = leaderCount;
            raiderStrength = raiderStrength - modifier;
        }
        UIImage* yellowHoard = [UIImage imageNamed:@"yellowhoard.png"];
        UIImageView* yellowHoardView = [[UIImageView alloc]initWithImage:yellowHoard];
        self.yellowHoardRect = CGRectMake(175, 580, yellowHoard.size.width, yellowHoard.size.height);
        self.yellowHoard = [[UIView alloc] initWithFrame:self.yellowHoardRect];
        [self.yellowHoard addSubview:yellowHoardView];
        [self.view addSubview:self.yellowHoard];
        if (raiderStrength > defenceCount)
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"The raiders have won the battle.."];
            [self labelNotificationAnimation];
            self.heartCount = self.heartCount - 1;
            if (self.heartCount == 2 )
            {
                UIImage* heartLossOne = [UIImage imageNamed:@"lossone.png"];
                UIImageView* lossOneHeartView = [[UIImageView alloc]initWithImage:heartLossOne];
                self.lossOneHeart = CGRectMake(7, 78, heartLossOne.size.width, heartLossOne.size.height);
                self.lossOneHeartUIView = [[UIView alloc] initWithFrame:self.lossOneHeart];
                [self.lossOneHeartUIView addSubview:lossOneHeartView];
                [self.view addSubview:self.lossOneHeartUIView];
            }
            else if (self.heartCount == 1)
            {
                UIImage* heartLossTwo = [UIImage imageNamed:@"losstwo.png"];
                UIImageView* lossTwoHeartView = [[UIImageView alloc]initWithImage:heartLossTwo];
                self.lossTwoHeart = CGRectMake(7, 78, heartLossTwo.size.width, heartLossTwo.size.height);
                self.lossTwoHeartUIView = [[UIView alloc] initWithFrame:self.lossTwoHeart];
                [self.lossTwoHeartUIView addSubview:lossTwoHeartView];
                [self.view addSubview:self.lossTwoHeartUIView];
            }
            else if (self.heartCount == 0)
            {
                UIImage* heartLossThree = [UIImage imageNamed:@"lossthree.png"];
                UIImageView* lossThreeHeartView = [[UIImageView alloc]initWithImage:heartLossThree];
                self.lossthreeHeart = CGRectMake(7, 78, heartLossThree.size.width, heartLossThree.size.height);
                self.lossThreeHeartUIView = [[UIView alloc] initWithFrame:self.lossthreeHeart];
                [self.lossThreeHeartUIView addSubview:lossThreeHeartView];
                [self.view addSubview:self.lossThreeHeartUIView];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have ran out of hearts!"
                                                                message:@"GAME OVER "
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK",nil];
                [alert show];
                
                
            }
        }
        if (raiderStrength < defenceCount)
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"You have fended off the raiders!"];
            [self labelNotificationAnimation];
            coins = coins + 100;
            
            
        }
        
        
    }

    else
    {
        raiderStrength = arc4random() % 300;
        //add monsters
        if (leaderCount >= 1)
        {
            int modifier;
            modifier = leaderCount;
            raiderStrength = raiderStrength - modifier;
        }
        UIImage* redHoard = [UIImage imageNamed:@"redhoard.png"];
        UIImageView* redHoardView = [[UIImageView alloc]initWithImage:redHoard];
        self.redHoardRect = CGRectMake(175, 580, redHoard.size.width, redHoard.size.height);
        self.redHoard = [[UIView alloc] initWithFrame:self.redHoardRect];
        [self.redHoard addSubview:redHoardView];
        [self.view addSubview:self.redHoard];
        if (raiderStrength > defenceCount)
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"The raiders have won the battle.."];
            [self labelNotificationAnimation];
            self.heartCount = self.heartCount - 1;
            if (self.heartCount == 2 )
            {
                UIImage* heartLossOne = [UIImage imageNamed:@"lossone.png"];
                UIImageView* lossOneHeartView = [[UIImageView alloc]initWithImage:heartLossOne];
                self.lossOneHeart = CGRectMake(7, 78, heartLossOne.size.width, heartLossOne.size.height);
                self.lossOneHeartUIView = [[UIView alloc] initWithFrame:self.lossOneHeart];
                [self.lossOneHeartUIView addSubview:lossOneHeartView];
                [self.view addSubview:self.lossOneHeartUIView];
            }
            else if (self.heartCount == 1)
            {
                UIImage* heartLossTwo = [UIImage imageNamed:@"losstwo.png"];
                UIImageView* lossTwoHeartView = [[UIImageView alloc]initWithImage:heartLossTwo];
                self.lossTwoHeart = CGRectMake(7, 78, heartLossTwo.size.width, heartLossTwo.size.height);
                self.lossTwoHeartUIView = [[UIView alloc] initWithFrame:self.lossTwoHeart];
                [self.lossTwoHeartUIView addSubview:lossTwoHeartView];
                [self.view addSubview:self.lossTwoHeartUIView];
            }
            else if (self.heartCount == 0)
            {
                UIImage* heartLossThree = [UIImage imageNamed:@"lossthree.png"];
                UIImageView* lossThreeHeartView = [[UIImageView alloc]initWithImage:heartLossThree];
                self.lossthreeHeart = CGRectMake(7, 78, heartLossThree.size.width, heartLossThree.size.height);
                self.lossThreeHeartUIView = [[UIView alloc] initWithFrame:self.lossthreeHeart];
                [self.lossThreeHeartUIView addSubview:lossThreeHeartView];
                [self.view addSubview:self.lossThreeHeartUIView];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have ran out of hearts!"
                                                                message:@"GAME OVER "
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK",nil];
                [alert show];
                
                
            }
            
            
        }
        if (raiderStrength < defenceCount)
        {
            self.notificationLabel.text = [NSString stringWithFormat:@"You have fended off the raiders!"];
            [self labelNotificationAnimation];
            coins = coins + 100;
            
            
        }
    }

    
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        //seleced to not quit
    }
    else if (buttonIndex == 0) {
        
        //[self.timerDelegate endingTimer];
        
        [self performSegueWithIdentifier:@"endedGame" sender:self];
        
        //need to delegate
    }
}



-(void) thisIsASecond
{
    second++;
    combatWarningTimer++;
    combatTimer++;
    NSLog(@"the timer is at %i",second);
    
    if (second == 60) {//45?
        
        [self myTimerFired];
        second = 0;

    }
    if (combatWarningTimer == 40)
    {
        [self combatWarning];
    }
    if (combatTimer == 45)//60?
    {
        [self combat];
        combatTimer = 0;
        combatWarningTimer = 0;
        self.structButton.enabled = true;
        self.personButton.enabled = true;
        
    }
}
-(void) myTimerFired
{

    coinBonus = 0;
    NSLog(@"timer fired %i", coins);
    
    if(pubCoinBonus == TRUE)
    {
        coinBonus = coinBonus + 10;
    }
 
    if (townCenterCoinBonus == TRUE)
    {
        coinBonus = coinBonus + 50;
    }
    if (farmCoinBonus == TRUE)
    {
        coinBonus = coinBonus + 20;
    }
    coins = coins + 100 + coinBonus;
    self.coinLabel.text =[NSString stringWithFormat:@"%i", coins];
    
    
}
/*
-(void) editedTimerFiredForPossibleBonuses
{
    NSLog(@"timer fired for bonuses, total coins:  %i", coins)
    
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
