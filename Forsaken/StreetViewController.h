//
//  StreetViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/19/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

int playerMovement;//Player's Horizontal Speed
int zombieMovement;//Zombie's Vertical Speed
int randomStreetValue;//Zombie's possible positions on the street
int distance; //The distance until location is reached
BOOL dead; //For determining whether the player is dead or not when the EndRun method is called.

BOOL addedWorkers;

NSTimer * deathCheckTimer;

@interface StreetViewController : UIViewController{
    
    //MovementButtons
    NSTimer *ButtonTimer1;
    NSTimer *ButtonTimer2;
    BOOL RightButtonPressed;
    BOOL LeftButtonPressed;
    
    //ImageViews
    IBOutlet UIImageView *Player;
    
    IBOutlet UIImageView *Zombie1;
    IBOutlet UIImageView *Zombie2;
    IBOutlet UIImageView *Zombie3;
    IBOutlet UIImageView *Zombie4;
    IBOutlet UIImageView *Zombie5;
    IBOutlet UIImageView *Zombie6;
    
    IBOutlet UIImageView *StreetBackground1;
    IBOutlet UIImageView *StreetBackground2;
    
    
    //ImageMovement
    NSTimer *ObjectTimer;
    
    //Distance
    NSTimer *DistanceTimer;
    
    IBOutlet UIProgressView *health;
    
}

//Movement Buttons
-(void)PressRightButton: (id)sender;
-(void)PressLeftButton: (id)sender;

- (IBAction)theRightTouchDown:(id)sender;
- (IBAction)theRightTouchUpInside:(id)sender;
- (IBAction)theRightTouchUpOutside:(id)sender;

- (IBAction)theLeftTouchDown:(id)sender;
- (IBAction)theLeftTouchUpInside:(id)sender;
- (IBAction)theLeftTouchUpOutside:(id)sender;

//Movement Illusion
- (IBAction)StartObjectMovement:(id)sender;

-(void)MoveObjects;
-(void)ObjectsInitialPositions;
@property (strong, nonatomic) IBOutlet UIButton *StartButton;

@property (strong, nonatomic) IBOutlet UIButton *TakeShelterButton;

//Health
-(void)UpdateHealth;


//Keep track of distance until destination is reached
-(void)UpdateDistance;


-(void)CollisionDetect;

-(void)EndRun;

@property (strong, nonatomic) IBOutlet UILabel *DeathLabel;
@property (strong, nonatomic) IBOutlet UILabel *DistanceLabel;

-(void)DeathCheck;


@end
