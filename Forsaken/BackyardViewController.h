//
//  BackyardViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Timers for the progress bars when clicking buttons.
NSTimer * pTimer6; //Plant Crops
NSTimer * pTimer7; //Harvest Crops
NSTimer * pTimer8; //Burn Wood
NSTimer * pTimer9; //Collect Water

//Timers to keep track of statuses.
NSTimer * healthTimer;
NSTimer * foodTimer;
NSTimer * waterTimer;
NSTimer * deathCheckTimer;

//Food Decay Timer
NSTimer *FoodDecayTimer;

//Workers
NSTimer *WorkersTimerLR;
NSTimer *WorkersTimerSR;

//Crops
NSTimer *CropUpdateTimer;

//Keeps track if a bar was in the progress of moving while the page was left.
BOOL InProgress6;
BOOL InProgress7;
BOOL InProgress8;
BOOL InProgress9;

@interface BackyardViewController : UIViewController{
    
    //Progress Bars:
    IBOutlet UIProgressView *prog6;
    IBOutlet UIProgressView *prog7;
    IBOutlet UIProgressView *prog8;
    IBOutlet UIProgressView *prog9;
    
    IBOutlet UIProgressView *health;
    IBOutlet UIProgressView *food;
    IBOutlet UIProgressView *water;
}

//Methods to update statuses overtime
-(void)DecreaseFood;
-(void)DecreaseWater;
-(void)IncreaseHealth;

@property (strong, nonatomic) IBOutlet UILabel *PlantedCropsLabel;
@property (strong, nonatomic) IBOutlet UILabel *RipeCropsLabel;
@property (strong, nonatomic) IBOutlet UILabel *TotalCropsLabel;
@property (strong, nonatomic) IBOutlet UILabel *WoodLabel;




@property (strong, nonatomic) IBOutlet UILabel *StatusUpdateLabel;
@property (strong, nonatomic) IBOutlet UITextView *BackyardTextBox;
@property (strong, nonatomic) IBOutlet UIImageView *BackyardBackground;

- (void)StopStatusTimers;

-(void)SetUpBackyard;

- (IBAction)ClickShelter:(id)sender;
-(IBAction)ClickHarvestCrops:(id)sender;
- (IBAction)ClickPlantCrops:(id)sender;
- (IBAction)ClickBurnWood:(id)sender;
- (IBAction)ClickCollectWater:(id)sender;

-(void)UpdatePlantCropsProgress;
-(void)UpdateHarvestCropsProgress;
-(void)UpdateBurnWoodProgress;
-(void)UpdateCollectWaterProgress;

-(void)UpdateCrops;

//Workers
-(void)WorkersUpdateLR;
-(void)WorkersUpdateSR;

-(void)DeathCheck;

//Food Decay
-(void)DecayFood;

@end
