//
//  WreckageViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/17/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "WreckageViewController.h"
#import "AllSupplies.h"
#import "SupplyViewController.h"
#import "ProgressViews.h"
#import "TextBox.h"
#import "Workers.h"

@interface WreckageViewController ()

@end

@implementation WreckageViewController

-(void)LoseHealth{
    Health -= HealthIncrement;
    [health setProgress:Health];
}

-(void)DeathCheck{
    if (Health <= 0.0) {
        [pTimer invalidate];
        [pTimer2 invalidate];
        [PaceTimer invalidate];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

//Search Wreckage:
-(void)UpdateSearchWreckageProgress{
    if (prog1.progress < 1) {
        [prog1 setProgress:prog1.progress + ProgIncrement1];
        Prog1 += ProgIncrement1;
    }
    else if (prog1.progress >= 1){
        [pTimer invalidate];
        [prog1 setProgress:0.0];
        Prog1 = 0.0;
        InProgress1 = NO;
        //What the button does:
        metalscrapAmount += 2;
        gasolineAmount += 1;
        _SupplyUpdateLabel.text =@"  +2 Metal Scrap   +1 Gasoline";
    }
}

-(IBAction)ClickSearchWreckage:(id)sender{
    if (prog1.progress == 0 && InProgress1 == NO) {
        pTimer = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed1 target:self selector:@selector(UpdateSearchWreckageProgress) userInfo:nil repeats:YES];
        InProgress1 = YES;
    }
    
}

//Revive Crew:
-(void)UpdateReviveCrewProgress{
    if (prog2.progress < 1) {
        [prog2 setProgress:prog2.progress + ProgIncrement2];
        Prog2 += ProgIncrement2;
    }
    else if (prog2.progress >= 1){
        [pTimer2 invalidate];
        [prog2 setProgress:0.0];
        Prog2 = 0.0;
        InProgress2 = NO;
        //What the button does:
        totalworkersAmount += 1;
        freeworkersAmount += 1;
        _SupplyUpdateLabel.text = @"You saved someone.";
    }
}

-(IBAction)ClickReviveCrew:(id)sender{
    if (prog2.progress == 0.0 && InProgress2 == NO) {
        pTimer2 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed2 target:self selector:@selector(UpdateReviveCrewProgress) userInfo:nil repeats:YES];
        InProgress2 = YES;
    }
}

-(void)ContinueProgress1:(BOOL)InProgress{
    
    if (InProgress1 == YES) {
        pTimer = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed1 target:self selector:@selector(UpdateSearchWreckageProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress2:(BOOL)InProgress{
    
    if (InProgress2 == YES) {
        pTimer2 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed2 target:self selector:@selector(UpdateReviveCrewProgress) userInfo:nil repeats:YES];
    }
}

- (IBAction)SupplyButton:(id)sender {
    
    [pTimer invalidate];
    [pTimer2 invalidate];
    [PaceTimer invalidate];
}

- (IBAction)RunButton:(id)sender {
    
    [pTimer invalidate];
    [pTimer2 invalidate];
    [PaceTimer invalidate];
}

-(void)WreckagePacer{
    
    if (WreckageTimeSinceStart == 1) {
        _WreckageTextBox.text = Message1;
        WreckageCurrentText = Message1;
    }
    else if (WreckageTimeSinceStart > 10){
        _WreckageTextBox.text = Message2;
        WreckageCurrentText = Message2;
        [self LoseHealth];
    }
    
    
    WreckageTimeSinceStart += 1;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _WreckageTextBox.text = WreckageCurrentText;
    
    [prog1 setProgress:Prog1];
    [prog2 setProgress:Prog2];
    [health setProgress:Health];
    
    PaceTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WreckagePacer) userInfo:nil repeats:YES];

    
    deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DeathCheck) userInfo:nil repeats:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self ContinueProgress1:InProgress1];
    [self ContinueProgress2:InProgress2];
}

-(void)viewWillDisappear:(BOOL)animated{
    
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
 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
