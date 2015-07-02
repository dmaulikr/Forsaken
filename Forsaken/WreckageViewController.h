//
//  WreckageViewController.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/17/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//Timers for the progress bars when clicking buttons.
NSTimer * pTimer; //Search Wreckage
NSTimer * pTimer2; //Revive Crew

NSTimer *PaceTimer;

NSTimer * deathCheckTimer;


BOOL InProgress1;
BOOL InProgress2;

int SearchWreckageRandom;

@interface WreckageViewController : UIViewController{
    
    IBOutlet UIProgressView *prog1;
    IBOutlet UIProgressView *prog2;
    
    IBOutlet UIProgressView *health;
    
}

-(IBAction)ClickSearchWreckage:(id)sender;
-(void)UpdateSearchWreckageProgress;
-(void)ContinueProgress1:(BOOL)InProgress;

-(IBAction)ClickReviveCrew:(id)sender;
-(void)UpdateReviveCrewProgress;
-(void)ContinueProgress2:(BOOL)InProgress;

- (IBAction)SupplyButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *WreckageTextBox;
@property (strong, nonatomic) IBOutlet UILabel *SupplyUpdateLabel;


-(void)WreckagePacer;
-(void)LoseHealth;

-(void)DeathCheck;


@end
