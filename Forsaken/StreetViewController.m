//
//  StreetViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/19/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "StreetViewController.h"
#import "ProgressViews.h"
#import "TextBox.h"
#import "AllSupplies.h"
#import "Workers.h"

@interface StreetViewController ()

@end

@implementation StreetViewController


-(void)DeathCheck{
    if (Health <= 0.0) {
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(void)UpdateHealth{
    [health setProgress:Health];
}

-(void)UpdateDistance{
    if (distance > 0) {
        distance -= 1;
        _DistanceLabel.text = [NSString stringWithFormat:@"Distance: %i meters", distance];
    }
    else if (distance == 0) {
        dead = NO;
        [self EndRun];
        _TakeShelterButton.hidden = NO;
        if (totalworkersAmount < maximumworkersAmount && addedWorkers == NO) {
            totalworkersAmount += 1;
            freeworkersAmount += 1;
            addedWorkers = YES;
        }
    }
}

-(void)EndRun{
    [ButtonTimer1 invalidate];
    [ButtonTimer2 invalidate];
    [ObjectTimer invalidate];
    [DistanceTimer invalidate];
    if (dead == YES) {
        _DeathLabel.hidden = NO;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerZombie.png"];
        deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(DeathCheck) userInfo:nil repeats:NO];
        
    }
    
}

-(void)CollisionDetect{
    Player.image = [UIImage imageNamed: @"ForsakenPlayer.png"];
    if (CGRectIntersectsRect(Player.frame, Zombie1.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (CGRectIntersectsRect(Player.frame, Zombie2.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (CGRectIntersectsRect(Player.frame, Zombie3.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (CGRectIntersectsRect(Player.frame, Zombie4.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (CGRectIntersectsRect(Player.frame, Zombie5.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (CGRectIntersectsRect(Player.frame, Zombie6.frame)) {
        Health -= 0.02;
        Player.image = [UIImage imageNamed: @"ForsakenPlayerTakingDamage.png"];
    }
    if (Health <= 0.0) {
        dead = YES;
        [self EndRun];
    }
    [self UpdateHealth];
    //[self DeathCheck];
}


-(void)ObjectsInitialPositions{
    StreetBackground2.center = CGPointMake(StreetBackground2.center.x, -284);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie1.center = CGPointMake(randomStreetValue, -20);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie2.center = CGPointMake(randomStreetValue, -120);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie3.center = CGPointMake(randomStreetValue, -220);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie4.center = CGPointMake(randomStreetValue, -320);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie5.center = CGPointMake(randomStreetValue, -420);
    
    randomStreetValue = arc4random() %220;
    randomStreetValue += 50;
    Zombie6.center = CGPointMake(randomStreetValue, -520);
    
}

- (IBAction)StartObjectMovement:(id)sender {
    _StartButton.hidden = YES;
    //Set initial position of objects:
    [self ObjectsInitialPositions];
    //Movement Buttons
    RightButtonPressed = NO;
    LeftButtonPressed = NO;
    ButtonTimer1 = [NSTimer scheduledTimerWithTimeInterval: 0.05 target:self selector:@selector(PressRightButton:) userInfo:nil repeats: YES];
    ButtonTimer2 = [NSTimer scheduledTimerWithTimeInterval: 0.05 target:self selector:@selector(PressLeftButton:) userInfo:nil repeats: YES];
    playerMovement = 4;
    zombieMovement = 8;
    //Object Movement Timer
    ObjectTimer = [NSTimer scheduledTimerWithTimeInterval: 0.05 target:self selector:@selector(MoveObjects) userInfo:nil repeats: YES];
    DistanceTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(UpdateDistance) userInfo:nil repeats: YES];
}

-(void)MoveObjects{
    
    StreetBackground1.center = CGPointMake(StreetBackground1.center.x, StreetBackground1.center.y + 4);
    StreetBackground2.center = CGPointMake(StreetBackground2.center.x, StreetBackground2.center.y + 4);
    
    if (StreetBackground1.center.y > 852) {
        StreetBackground1.center = CGPointMake(StreetBackground1.center.x, -284);
    }
    if (StreetBackground2.center.y > 852) {
        StreetBackground2.center = CGPointMake(StreetBackground2.center.x, -284);
    }
    
    
    Zombie1.center = CGPointMake(Zombie1.center.x, Zombie1.center.y + 6);               //Slow Zombie
    Zombie2.center = CGPointMake(Zombie2.center.x, Zombie2.center.y + zombieMovement);
    Zombie3.center = CGPointMake(Zombie3.center.x, Zombie3.center.y + zombieMovement);
    Zombie4.center = CGPointMake(Zombie4.center.x, Zombie4.center.y + zombieMovement);
    Zombie5.center = CGPointMake(Zombie5.center.x, Zombie5.center.y + 10);              //Fast Zombie
    Zombie6.center = CGPointMake(Zombie6.center.x, Zombie6.center.y + zombieMovement);
    
    if (Zombie1.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie1.center = CGPointMake(randomStreetValue, -20);
    }
    
    if (Zombie2.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie2.center = CGPointMake(randomStreetValue, -20);
    }
    if (Zombie3.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie3.center = CGPointMake(randomStreetValue, -20);
    }
    if (Zombie4.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie4.center = CGPointMake(randomStreetValue, -20);
    }
    if (Zombie5.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie5.center = CGPointMake(Player.center.x, -20);                             //Targets Player
    }
    if (Zombie6.center.y > 568) {
        randomStreetValue = arc4random() %220;
        randomStreetValue += 50;
        Zombie6.center = CGPointMake(randomStreetValue, -20);
    }
    [self CollisionDetect];
}


#pragma Movement Buttons
//These functions control what happens when the right and left buttons are held down.
- (IBAction)theRightTouchDown:(id)sender{
    RightButtonPressed = YES;
}
- (IBAction)theRightTouchUpInside:(id)sender{
    RightButtonPressed = NO;
}
- (IBAction)theRightTouchUpOutside:(id)sender{
    RightButtonPressed = NO;
}

- (IBAction)theLeftTouchDown:(id)sender {
    LeftButtonPressed = YES;
}

- (IBAction)theLeftTouchUpInside:(id)sender {
    LeftButtonPressed = NO;
}

- (IBAction)theLeftTouchUpOutside:(id)sender {
    LeftButtonPressed = NO;
}

//What happens when the Right Button is held down:
-(void)PressRightButton: (id)sender{
    
    if (RightButtonPressed == YES && Player.center.x < 257) {
        //This is for "Touch and Hold"
        Player.center = CGPointMake(Player.center.x + playerMovement, Player.center.y);
    }
    else {
        //This is for the person is off the button.
    }
}
//What happens when the Left Button is held down:
-(void)PressLeftButton: (id)sender{
    
    if (LeftButtonPressed == YES && Player.center.x > 63) {
        //This is for "Touch and Hold"
        Player.center = CGPointMake(Player.center.x - playerMovement, Player.center.y);
    }
    else {
        //This is for the person is off the button.
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _DeathLabel.hidden = YES;
    distance = 0 + (totalworkersAmount * 10);
    addedWorkers = NO;
    [self UpdateHealth];
    _DistanceLabel.text = [NSString stringWithFormat:@"Distance: %i meters",distance];
    _TakeShelterButton.hidden = YES;
    
    //deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(DeathCheck) userInfo:nil repeats:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [ButtonTimer1 invalidate];
    [ButtonTimer2 invalidate];
    [ObjectTimer invalidate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Keeps App in Portait Mode
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait);
}

@end
