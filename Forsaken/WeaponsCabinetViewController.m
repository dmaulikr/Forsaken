//
//  WeaponsCabinetViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "WeaponsCabinetViewController.h"
#import "ProgressViews.h"
#import "AllSupplies.h"
#import "Workers.h"

@interface WeaponsCabinetViewController ()

@end

@implementation WeaponsCabinetViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(IBAction)ClickClub:(id)sender{
    if (woodAmount >= 10 && clubAmount < totalworkersAmount) {
        clubAmount += 1;
        woodAmount -= 10;
        securityAmount += 1;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickSpikedClub:(id)sender{
    if (woodAmount >= 10 && nailsAmount >= 10 && spikedclubAmount < totalworkersAmount) {
        spikedclubAmount += 1;
        woodAmount -= 10;
        nailsAmount -= 10;
        securityAmount += 2;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickLongBow:(id)sender{
    if (woodAmount >= 15 && stringAmount >= 10 && longbowAmount < totalworkersAmount) {
        longbowAmount += 1;
        woodAmount -= 15;
        stringAmount -= 10;
        securityAmount += 3;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickMace:(id)sender{
    if (woodAmount >= 10 && nailsAmount >= 15 && metalAmount >= 5 && maceAmount < totalworkersAmount) {
        maceAmount += 1;
        woodAmount -= 10;
        nailsAmount -= 15;
        metalAmount -= 5;
        securityAmount += 4;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickMachete:(id)sender{
    if (metalAmount >= 15 && clothAmount >= 5 && macheteAmount < totalworkersAmount) {
        macheteAmount += 1;
        metalAmount -= 15;
        clothAmount -= 5;
        securityAmount += 5;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickPistol:(id)sender{
    if (metalAmount >= 20 && screwsAmount >= 10 && pistolAmount < totalworkersAmount) {
        pistolAmount += 1;
        metalAmount -= 20;
        screwsAmount -= 10;
        securityAmount += 10;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickShotgun:(id)sender{
    if (metalAmount >= 30 && screwsAmount >= 20 && shotgunAmount < totalworkersAmount) {
        shotgunAmount += 1;
        metalAmount -= 30;
        screwsAmount -= 20;
        securityAmount += 15;
    }
    [self SetUpWeaponsCabinet];
}

-(IBAction)ClickSniper:(id)sender{
    if (metalAmount >= 30 && screwsAmount >= 20 && glassAmount >= 5 && sniperAmount < totalworkersAmount) {
        sniperAmount += 1;
        metalAmount -= 30;
        screwsAmount -= 20;
        glassAmount -= 5;
        securityAmount += 20;
    }
    [self SetUpWeaponsCabinet];
}


-(void)SetUpWeaponsCabinet{
    //Background
    if (electricityAmount > 0) {
        _WeaponsCabinetBackground.image = [UIImage imageNamed: @"WeaponsCabinetLight.png"];
    }
    else {
        _WeaponsCabinetBackground.image = [UIImage imageNamed: @"WeaponsCabinetDark.png"];
    }
    
    //Button Colors
    if (clubAmount >= totalworkersAmount) {
        [_ClickClub setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (clubAmount < totalworkersAmount){
        [_ClickClub setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (spikedclubAmount >= totalworkersAmount) {
        [_ClickSpikedClub setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (spikedclubAmount < totalworkersAmount){
        [_ClickSpikedClub setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (longbowAmount >= totalworkersAmount) {
        [_ClickLongBow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (longbowAmount < totalworkersAmount){
        [_ClickLongBow setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (maceAmount >= totalworkersAmount) {
        [_ClickMace setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (maceAmount < totalworkersAmount){
        [_ClickMace setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (macheteAmount >= totalworkersAmount) {
        [_ClickMachete setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (macheteAmount < totalworkersAmount){
        [_ClickMachete setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (pistolAmount >= totalworkersAmount) {
        [_ClickPistol setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (pistolAmount < totalworkersAmount){
        [_ClickPistol setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (shotgunAmount >= totalworkersAmount) {
        [_ClickShotgun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (shotgunAmount < totalworkersAmount){
        [_ClickShotgun setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (sniperAmount >= totalworkersAmount) {
        [_ClickSniper setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (sniperAmount < totalworkersAmount){
        [_ClickSniper setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    //Counter Labels
    _ClubCounterLabel.text = [NSString stringWithFormat:@"%i / %i", clubAmount, totalworkersAmount];
    _SpikedClubCounterLabel.text = [NSString stringWithFormat:@"%i / %i", spikedclubAmount, totalworkersAmount];
    _LongBowCounterLabel.text = [NSString stringWithFormat:@"%i / %i", longbowAmount, totalworkersAmount];
    _MaceCounterLabel.text = [NSString stringWithFormat:@"%i / %i", maceAmount, totalworkersAmount];
    _MacheteCounterLabel.text = [NSString stringWithFormat:@"%i / %i", macheteAmount, totalworkersAmount];
    _PistolCounterLabel.text = [NSString stringWithFormat:@"%i / %i", pistolAmount, totalworkersAmount];
    _ShotgunCounterLabel.text = [NSString stringWithFormat:@"%i / %i", shotgunAmount, totalworkersAmount];
    _SniperCounterLabel.text = [NSString stringWithFormat:@"%i / %i", sniperAmount, totalworkersAmount];
    
}


-(IBAction)ClickGarage:(id)sender{
    [self StopStatusTimers];
}


- (void)StopStatusTimers{
    [healthTimer invalidate];
    healthTimer = nil;
    [foodTimer invalidate];
    foodTimer = nil;
    [waterTimer invalidate];
    waterTimer = nil;
    [WorkersTimerLR invalidate];
    [WorkersTimerSR invalidate];
    [CropUpdateTimer invalidate];
    //Food Decay
    [FoodDecayTimer invalidate];
}

//Status Change Overtime
-(void)DecreaseFood{
    if (Food > 0) {
        Food -= FoodIncrementDown;
    }
    else{
        Health -= HealthIncrement;
    }
}

-(void)DecreaseWater{
    if (Water > 0) {
        Water -= WaterIncrementDown;
    }
    else{
        Health -= HealthIncrement;
    }
}

-(void)IncreaseHealth{
    if (Health > 0) {
        if (Food > 0.9 && Water > 0.9) {
            Health += HealthIncrement;
        }
    }
}

- (void)WorkersUpdateLR{
    [Workers UpdateLRWorkersOutput];
}

- (void) WorkersUpdateSR{
    [Workers UpdateSRWorkersOutput];
}

-(void)UpdateCrops{
    [AllSupplies CropCounter];
}

-(void)DecayFood{
    [AllSupplies FoodDecay];
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
    [self SetUpWeaponsCabinet];
    
    //Timers:
    healthTimer = [NSTimer scheduledTimerWithTimeInterval:HealthSpeed target:self selector:@selector(IncreaseHealth) userInfo:nil repeats:YES];
    foodTimer = [NSTimer scheduledTimerWithTimeInterval:FoodSpeed target:self selector:@selector(DecreaseFood) userInfo:nil repeats:YES];
    waterTimer = [NSTimer scheduledTimerWithTimeInterval:WaterSpeed target:self selector:@selector(DecreaseWater) userInfo:nil repeats:YES];
    
    WorkersTimerLR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateLR) userInfo:nil repeats:YES];
    WorkersTimerSR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateSR) userInfo:nil repeats:YES];
    
    CropUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateCrops) userInfo:nil repeats:YES];
    
    deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DeathCheck) userInfo:nil repeats:YES];
    FoodDecayTimer = [NSTimer scheduledTimerWithTimeInterval:fooddecayspeed target:self selector:@selector(DecayFood) userInfo:nil repeats:YES];
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
