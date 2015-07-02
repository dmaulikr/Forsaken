//
//  WeaponsCabinetViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Status Timers
NSTimer *healthTimer;
NSTimer *foodTimer;
NSTimer *waterTimer;
NSTimer * deathCheckTimer;
//Food Decay Timer
NSTimer *FoodDecayTimer;
//Workers Timers
NSTimer *WorkersTimerLR;
NSTimer *WorkersTimerSR;
//Crop Timer
NSTimer *CropUpdateTimer;

@interface WeaponsCabinetViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *ClickClub;
@property (strong, nonatomic) IBOutlet UIButton *ClickSpikedClub;
@property (strong, nonatomic) IBOutlet UIButton *ClickLongBow;
@property (strong, nonatomic) IBOutlet UIButton *ClickMace;
@property (strong, nonatomic) IBOutlet UIButton *ClickMachete;
@property (strong, nonatomic) IBOutlet UIButton *ClickPistol;
@property (strong, nonatomic) IBOutlet UIButton *ClickShotgun;
@property (strong, nonatomic) IBOutlet UIButton *ClickSniper;



@property (strong, nonatomic) IBOutlet UILabel *ClubCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *SpikedClubCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *LongBowCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *MaceCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *MacheteCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *PistolCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *ShotgunCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *SniperCounterLabel;



@property (strong, nonatomic) IBOutlet UIImageView *WeaponsCabinetBackground;


-(void)SetUpWeaponsCabinet;




- (void)StopStatusTimers;

//Workers
-(void)WorkersUpdateLR;
-(void)WorkersUpdateSR;

//Crops
-(void)UpdateCrops;

-(void)DeathCheck;

//Food Decay
-(void)DecayFood;






@end
