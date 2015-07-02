//
//  ShelterViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/20/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

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

//Crop Timer
NSTimer *CropsTimer;

@interface ShelterViewController : UIViewController{

    IBOutlet UIProgressView *health;
    IBOutlet UIProgressView *food;
    IBOutlet UIProgressView *water;
    
    
}

@property (strong, nonatomic) IBOutlet UILabel *StatusUpdateLabel;
@property (strong, nonatomic) IBOutlet UITextView *ShelterTextBox;
@property (strong, nonatomic) IBOutlet UIImageView *ShelterBackground;


- (IBAction)ClickKitchen:(id)sender;
- (IBAction)ClickStoreRoom:(id)sender;
- (IBAction)ClickGarage:(id)sender;
- (IBAction)ClickLivingRoom:(id)sender;
- (IBAction)ClickBackyard:(id)sender;
- (IBAction)ClickStreet:(id)sender;

- (void)StopStatusTimers;

//Workers
-(void)WorkersUpdateLR;
-(void)WorkersUpdateSR;

//Crops
-(void)UpdateCrops;

-(void)DeathCheck;

//Food Decay
-(void)DecayFood;

-(void)SetUpShelter;

@end
