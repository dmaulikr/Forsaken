//
//  KitchenViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/21/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Timers for the progress bars when clicking buttons.
NSTimer * pTimer3; //Drink Water
NSTimer * pTimer4; //Eat Food
NSTimer * pTimer5; //Preserve Food

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
NSTimer *CropUpdateTimer;

//Keeps track if a bar was in the progress of moving while the page was left.
BOOL InProgress3;
BOOL InProgress4;
BOOL InProgress5;

@interface KitchenViewController : UIViewController{
    
    //Progress Bars:
    IBOutlet UIProgressView *prog3;
    IBOutlet UIProgressView *prog4;
    IBOutlet UIProgressView *prog5;
    
    IBOutlet UIProgressView *health;
    IBOutlet UIProgressView *food;
    IBOutlet UIProgressView *water;

}

//Methods to update statuses overtime
-(void)DecreaseFood;
-(void)DecreaseWater;
-(void)IncreaseHealth;

@property (strong, nonatomic) IBOutlet UILabel *SaltLabel;
@property (strong, nonatomic) IBOutlet UILabel *WaterLabel;
@property (strong, nonatomic) IBOutlet UILabel *FoodLabel;



@property (strong, nonatomic) IBOutlet UILabel *StatusUpdateLabel;
@property (strong, nonatomic) IBOutlet UITextView *KitchenTextBox;
@property (strong, nonatomic) IBOutlet UIImageView *KitchenBackground;

- (IBAction)ClickDrinkWater:(id)sender;
- (IBAction)ClickEatFood:(id)sender;
- (IBAction)ClickShelter:(id)sender;
- (IBAction)ClickPreserveFood:(id)sender;


//Continues the progress of the progress views where they left off:
-(void)ContinueProgress3:(BOOL)InProgress;
-(void)ContinueProgress4:(BOOL)InProgress;
-(void)ContinueProgress5:(BOOL)InProgress;

//Workers
-(void)WorkersUpdateLR;
-(void)WorkersUpdateSR;

//Crops
-(void)UpdateCrops;

-(void)DeathCheck;

//Food Decay
-(void)DecayFood;

-(void)SetUpKitchen;

@end
