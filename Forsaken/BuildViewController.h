//
//  BuildViewController.h
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

@interface BuildViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *FenceButton;
@property (strong, nonatomic) IBOutlet UIButton *BoardWindowsButton;
@property (strong, nonatomic) IBOutlet UIButton *RainCollectorButton;
@property (strong, nonatomic) IBOutlet UIButton *FirePitButton;
@property (strong, nonatomic) IBOutlet UIButton *ShackButton;
@property (strong, nonatomic) IBOutlet UIButton *FridgeButton;
@property (strong, nonatomic) IBOutlet UIButton *SewingMachineButton;
@property (strong, nonatomic) IBOutlet UIButton *RadioButton;
@property (strong, nonatomic) IBOutlet UIButton *GasGeneratorButton;
@property (strong, nonatomic) IBOutlet UIButton *ForgeButton;
@property (strong, nonatomic) IBOutlet UIButton *BicycleButton;
@property (strong, nonatomic) IBOutlet UIButton *MotorcycleButton;
@property (strong, nonatomic) IBOutlet UIButton *JeepButton;
@property (strong, nonatomic) IBOutlet UIButton *ElectricCarButton;
@property (strong, nonatomic) IBOutlet UIButton *HybridButton;
@property (strong, nonatomic) IBOutlet UIButton *TruckButton;



@property (strong, nonatomic) IBOutlet UILabel *FenceCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *RainCollectorCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *ShackCounterLabel;
@property (strong, nonatomic) IBOutlet UILabel *BoardWindowsCounterLabel;






@property (strong, nonatomic) IBOutlet UITextView *BuildTextView;


@property (strong, nonatomic) IBOutlet UIImageView *BuildBackground;

-(void)SetUpBuild;



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
