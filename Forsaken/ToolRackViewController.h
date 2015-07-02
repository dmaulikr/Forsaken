//
//  ToolRackViewController.h
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

@interface ToolRackViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *ClickShovel;
@property (strong, nonatomic) IBOutlet UIButton *ClickSaw;
@property (strong, nonatomic) IBOutlet UIButton *ClickHammer;
@property (strong, nonatomic) IBOutlet UIButton *ClickBlowTorch;
@property (strong, nonatomic) IBOutlet UIButton *ClickChainSaw;
@property (strong, nonatomic) IBOutlet UIButton *ClickSolderingIron;
@property (strong, nonatomic) IBOutlet UIButton *ClickAxe;
@property (strong, nonatomic) IBOutlet UIButton *ClickSickle;


- (void)SetUpToolRack;

@property (strong, nonatomic) IBOutlet UIImageView *ToolRackBackground;



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
