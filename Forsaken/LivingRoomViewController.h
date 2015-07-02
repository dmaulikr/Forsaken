//
//  LivingRoomViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/23/14.
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

@interface LivingRoomViewController : UIViewController{
    
    
    IBOutlet UILabel *UnoccupiedWorkersLabel;
    
    IBOutlet UILabel *PreserveFoodLabel;
    IBOutlet UILabel *BurnWoodLabel;
    IBOutlet UILabel *CollectWaterLabel;
    IBOutlet UILabel *PlantCropsLabel;
    IBOutlet UILabel *HarvestCropsLabel;
    IBOutlet UILabel *ChopTreesLabel;
    IBOutlet UILabel *PurifyMetalLabel;
    IBOutlet UILabel *GuardShelterLabel;
    IBOutlet UILabel *HealMeLabel;
    IBOutlet UILabel *SewClothLabel;
    IBOutlet UILabel *MakeBatteriesLabel;
    IBOutlet UILabel *FuelGeneratorLabel;

    IBOutlet UILabel *CollectWaterGainLabel;
    IBOutlet UILabel *HarvestCropsGainLabel1;
    IBOutlet UILabel *HarvestCropsGainLabel2;
    IBOutlet UILabel *ChopTreesGainLabel;

    
    
    
    
    
    
}


- (IBAction)ClickAdd1:(id)sender;
- (IBAction)ClickAdd2:(id)sender;
- (IBAction)ClickAdd3:(id)sender;
- (IBAction)ClickAdd4:(id)sender;
- (IBAction)ClickAdd5:(id)sender;
- (IBAction)ClickAdd6:(id)sender;
- (IBAction)ClickAdd7:(id)sender;
- (IBAction)ClickAdd8:(id)sender;
- (IBAction)ClickAdd9:(id)sender;
- (IBAction)ClickAdd10:(id)sender;
- (IBAction)ClickAdd11:(id)sender;
- (IBAction)ClickAdd12:(id)sender;

- (IBAction)ClickSubtract1:(id)sender;
- (IBAction)ClickSubtract2:(id)sender;
- (IBAction)ClickSubtract3:(id)sender;
- (IBAction)ClickSubtract4:(id)sender;
- (IBAction)ClickSubtract5:(id)sender;
- (IBAction)ClickSubtract6:(id)sender;
- (IBAction)ClickSubtract7:(id)sender;
- (IBAction)ClickSubtract8:(id)sender;
- (IBAction)ClickSubtract9:(id)sender;
- (IBAction)ClickSubtract10:(id)sender;
- (IBAction)ClickSubtract11:(id)sender;
- (IBAction)ClickSubtract12:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *LivingRoomBackground;

-(void)SetUpLivingRoomLabels;



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
