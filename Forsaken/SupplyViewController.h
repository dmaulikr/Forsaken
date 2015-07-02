//
//  SupplyViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/18/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Status Timers
NSTimer *healthTimer;
NSTimer *foodTimer;
NSTimer *waterTimer;
NSTimer * deathCheckTimer;
//Workers Timers
NSTimer *WorkersTimerLR;
NSTimer *WorkersTimerSR;
//Crop Timer
NSTimer *CropUpdateTimer;
//Food Decay Timer
NSTimer *FoodDecayTimer;




@interface SupplyViewController : UIViewController{
    
    IBOutlet UILabel *WoodLabel;
    IBOutlet UILabel *NailsLabel;
    IBOutlet UILabel *CharcoalLabel;
    IBOutlet UILabel *GasolineLabel;
    IBOutlet UILabel *FoodLabel;
    IBOutlet UILabel *WaterLabel;
    IBOutlet UILabel *WireLabel;
    IBOutlet UILabel *ClothLabel;
    IBOutlet UILabel *MetalScrapLabel;
    IBOutlet UILabel *ScrewsLabel;
    IBOutlet UILabel *RubberLabel;
    IBOutlet UILabel *MetalLabel;
    IBOutlet UILabel *MedicineLabel;
    IBOutlet UILabel *StringLabel;
    IBOutlet UILabel *GlassLabel;
    IBOutlet UILabel *BatteriesLabel;
    IBOutlet UILabel *ElectricityLabel;
    IBOutlet UILabel *SaltLabel;
    IBOutlet UILabel *PreservedFoodLabel;
    IBOutlet UILabel *SeedsLabel;

}

-(void)SetUpSuppliesTable;

@property (strong, nonatomic) IBOutlet UIImageView *StoreRoomBackground;


- (void)StopStatusTimers;

//Workers
-(void)WorkersUpdateLR;
-(void)WorkersUpdateSR;

//Crops
-(void)UpdateCrops;

//Death Check
-(void)DeathCheck;

//Food Decay
-(void)DecayFood;

@end
