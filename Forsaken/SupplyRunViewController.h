//
//  SupplyRunViewController.h
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

@interface SupplyRunViewController : UIViewController{
    
    IBOutlet UILabel *UnoccupiedWorkersLabel;
    
    IBOutlet UILabel *LootHousesLabel;
    IBOutlet UILabel *LootCarsLabel;
    IBOutlet UILabel *JunkyardLabel;
    IBOutlet UILabel *GroceryStoreLabel;
    IBOutlet UILabel *HardwareStoreLabel;
    IBOutlet UILabel *PharmacyLabel;
    IBOutlet UILabel *ClothingStoreLabel;
    IBOutlet UILabel *GasStationLabel;
    
    
}


- (IBAction)ClickAdd13:(id)sender;
- (IBAction)ClickAdd14:(id)sender;
- (IBAction)ClickAdd15:(id)sender;
- (IBAction)ClickAdd16:(id)sender;
- (IBAction)ClickAdd17:(id)sender;
- (IBAction)ClickAdd18:(id)sender;
- (IBAction)ClickAdd19:(id)sender;
- (IBAction)ClickAdd20:(id)sender;

- (IBAction)ClickSubtract13:(id)sender;
- (IBAction)ClickSubtract14:(id)sender;
- (IBAction)ClickSubtract15:(id)sender;
- (IBAction)ClickSubtract16:(id)sender;
- (IBAction)ClickSubtract17:(id)sender;
- (IBAction)ClickSubtract18:(id)sender;
- (IBAction)ClickSubtract19:(id)sender;
- (IBAction)ClickSubtract20:(id)sender;

//SR Loot Labels
@property (strong, nonatomic) IBOutlet UILabel *GroceryStoreCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *GroceryStoreGainLabel1;
@property (strong, nonatomic) IBOutlet UILabel *GroceryStoreGainLabel2;
@property (strong, nonatomic) IBOutlet UILabel *ClothingStoreCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *ClothingStoreGainLabel1;
@property (strong, nonatomic) IBOutlet UILabel *PharmacyCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *PharmacyGainLabel1;
@property (strong, nonatomic) IBOutlet UILabel *HardwareStoreCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *HardwareStoreGainLabel1;
@property (strong, nonatomic) IBOutlet UILabel *HardwareStoreGainLabel2;
@property (strong, nonatomic) IBOutlet UILabel *GasStationCostLabel;
@property (strong, nonatomic) IBOutlet UILabel *GasStationGainLabel1;




@property (strong, nonatomic) IBOutlet UIImageView *SupplyRunBackground;
-(void)SetUpSRLabels;


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
