//
//  GarageViewController.h
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

@interface GarageViewController : UIViewController


//Vehicle Icons:
@property (strong, nonatomic) IBOutlet UIImageView *BicycleIcon;
@property (strong, nonatomic) IBOutlet UIImageView *MotorcycleIcon;
@property (strong, nonatomic) IBOutlet UIImageView *JeepIcon;
@property (strong, nonatomic) IBOutlet UIImageView *ElectricCarIcon;
@property (strong, nonatomic) IBOutlet UIImageView *HybridIcon;
@property (strong, nonatomic) IBOutlet UIImageView *TruckIcon;
//Vehicle Labels:
@property (strong, nonatomic) IBOutlet UILabel *BicycleLabel;
@property (strong, nonatomic) IBOutlet UILabel *MotorcycleLabel;
@property (strong, nonatomic) IBOutlet UILabel *JeepLabel;
@property (strong, nonatomic) IBOutlet UILabel *ElectricCarLabel;
@property (strong, nonatomic) IBOutlet UILabel *HybridLabel;
@property (strong, nonatomic) IBOutlet UILabel *TruckLabel;
//Vehicle Buttons
@property (strong, nonatomic) IBOutlet UIButton *MotorcycleButton;
@property (strong, nonatomic) IBOutlet UIButton *ElectricCarButton;
@property (strong, nonatomic) IBOutlet UIButton *HybridButton;
@property (strong, nonatomic) IBOutlet UIButton *TruckButton;
@property (strong, nonatomic) IBOutlet UIButton *JeepButton;








@property (strong, nonatomic) IBOutlet UIImageView *GarageBackground;

-(void)SetUpGarage;

-(void)UpdateSRLabels;

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
