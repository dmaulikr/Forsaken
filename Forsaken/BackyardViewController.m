//
//  BackyardViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "BackyardViewController.h"
#import "AllSupplies.h"
#import "TextBox.h"
#import "ProgressViews.h"
#import "Workers.h"

@interface BackyardViewController ()

@end

@implementation BackyardViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

//Status Change Overtime
-(void)DecreaseFood{
    if (food.progress > 0) {
        Food -= FoodIncrementDown;
        [food setProgress:Food];
    }
    else{
        Health -= HealthIncrement;
        [health setProgress:Health];
    }
}

-(void)DecreaseWater{
    if (water.progress > 0) {
        Water -= WaterIncrementDown;
        [water setProgress:Water];
    }
    else{
        Health -= HealthIncrement;
        [health setProgress:Health];
    }
}

-(void)IncreaseHealth{
    if (health.progress > 0) {
        if (food.progress > 0.9 && water.progress > 0.9) {
            Health += HealthIncrement;
            [health setProgress:Health];
        }
    }
}

//Plant Crops:
-(void)UpdatePlantCropsProgress{
    if (prog6.progress < 1 && seedsAmount > 0 && waterAmount > 0) {
        [prog6 setProgress:prog6.progress + ProgIncrement6];
        Prog6 += ProgIncrement6;
    }
    else if (prog6.progress >= 1 && seedsAmount > 0 && waterAmount > 0){
        [pTimer6 invalidate];
        [prog6 setProgress:0.0];
        Prog6 = 0.0;
        InProgress6 = NO;
        //What the button does:
        seedsAmount -= 1;
        waterAmount -= 1;
        [AllSupplies CropPlacer];
        CurrentStatusUpdate =@"The seed was planted.";
    }
    else if (seedsAmount < 1 && waterAmount < 1){
        CurrentStatusUpdate =@"No seeds or water.";
        [pTimer6 invalidate];
        InProgress6 = NO;
    }
    else if (seedsAmount < 1){
        CurrentStatusUpdate =@"No seeds to plant.";
        [pTimer6 invalidate];
        InProgress6 = NO;
    }
    else if (waterAmount < 1){
        CurrentStatusUpdate =@"Need water to plant seeds.";
        [pTimer6 invalidate];
        InProgress6 = NO;
    }
    [self SetUpBackyard];
}

- (IBAction)ClickPlantCrops:(id)sender{
    if (prog6.progress == 0 && InProgress6 == NO) {
        pTimer6 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed6 target:self selector:@selector(UpdatePlantCropsProgress) userInfo:nil repeats:YES];
        InProgress6 = YES;
    }
}

//Harvest Crops:
-(void)UpdateHarvestCropsProgress{
    if (prog7.progress < 1 && ripecropsAmount > 0) {
        [prog7 setProgress:prog7.progress + ProgIncrement7];
        Prog7 += ProgIncrement7;
    }
    else if (prog7.progress >= 1 && ripecropsAmount > 0){
        [pTimer7 invalidate];
        [prog7 setProgress:0.0];
        Prog7 = 0.0;
        InProgress7 = NO;
        //What the button does:
        seedsAmount += 2*ripecropsAmount;
        foodAmount += ripecropsAmount + (ripecropsAmount * sickleAmount);
        CurrentStatusUpdate = [NSString stringWithFormat:@"Crops harvested. +%i food", ripecropsAmount];
        ripecropsAmount = 0;
    }
    [self SetUpBackyard];
}

- (IBAction)ClickHarvestCrops:(id)sender{
    if (prog7.progress == 0 && InProgress7 == NO) {
        pTimer7 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed7 target:self selector:@selector(UpdateHarvestCropsProgress) userInfo:nil repeats:YES];
        InProgress7 = YES;
    }
    if (ripecropsAmount < 1 && plantedcropsAmount > 0){
        CurrentStatusUpdate =@"Crops are not ready for harvest.";
        [pTimer7 invalidate];
        InProgress7 = NO;
    }
    else if (ripecropsAmount < 1 && plantedcropsAmount < 1){
        CurrentStatusUpdate =@"No crops to harvest.";
        [pTimer7 invalidate];
        InProgress7 = NO;
    }
}

//Burn Wood:
-(void)UpdateBurnWoodProgress{
    if (prog8.progress < 1 && woodAmount > 0 && firepitAmount > 0) {
        [prog8 setProgress:prog8.progress + ProgIncrement8];
        Prog8 += ProgIncrement8;
    }
    else if (prog8.progress >= 1 && woodAmount > 0 && firepitAmount > 0){
        [pTimer8 invalidate];
        [prog8 setProgress:0.0];
        Prog8 = 0.0;
        InProgress8 = NO;
        //What the button does:
        woodAmount -= 1;
        charcoalAmount += 1;
        CurrentStatusUpdate = [NSString stringWithFormat:@"Wood burnt. +%i Charcoal", 1];
    }
    [self SetUpBackyard];
}

- (IBAction)ClickBurnWood:(id)sender{
    if (prog8.progress == 0 && InProgress8 == NO) {
        pTimer8 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed8 target:self selector:@selector(UpdateBurnWoodProgress) userInfo:nil repeats:YES];
        InProgress8 = YES;
    }
    if (firepitAmount < 1){
        CurrentStatusUpdate =@"Need a fire pit to burn wood.";
        [pTimer8 invalidate];
        InProgress8 = NO;
    }
    else if (woodAmount < 1){
        CurrentStatusUpdate =@"No wood to burn.";
        [pTimer8 invalidate];
        InProgress8 = NO;
    }
}

//Collect Water:
-(void)UpdateCollectWaterProgress{
    if (prog9.progress < 1 && raincollectorAmount > 0) {
        [prog9 setProgress:prog9.progress + ProgIncrement9];
        Prog9 += ProgIncrement9;
    }
    else if (prog9.progress >= 1 && raincollectorAmount > 0){
        [pTimer9 invalidate];
        [prog9 setProgress:0.0];
        Prog9 = 0.0;
        InProgress9 = NO;
        //What the button does:
        waterAmount += raincollectorAmount;
        CurrentStatusUpdate = [NSString stringWithFormat:@"Rain water collected. +%i Water", raincollectorAmount];
    }
    [self SetUpBackyard];
}

- (IBAction)ClickCollectWater:(id)sender{
    if (prog9.progress == 0 && InProgress9 == NO) {
        pTimer9 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed9 target:self selector:@selector(UpdateCollectWaterProgress) userInfo:nil repeats:YES];
        InProgress9 = YES;
    }
    if (raincollectorAmount == 0) {
        [pTimer9 invalidate];
        CurrentStatusUpdate = @"Need a rain collector.";
    }
}



- (void)StopStatusTimers{
    [healthTimer invalidate];
    //healthTimer = nil;
    [foodTimer invalidate];
    //foodTimer = nil;
    [waterTimer invalidate];
    //waterTimer = nil;
    [pTimer6 invalidate];
    [pTimer7 invalidate];
    [pTimer8 invalidate];
    [pTimer9 invalidate];
    //Workers
    [WorkersTimerLR invalidate];
    [WorkersTimerSR invalidate];
    //Crops
    [CropUpdateTimer invalidate];
    //Food Decay
    [FoodDecayTimer invalidate];
}

- (void)SetUpBackyard{
    /*
    if (plantedcropsAmount > 0) {
        _PlantedCropsLabel.text = [NSString stringWithFormat:@"Crops Planted: %i",plantedcropsAmount];
        //_PlantedCropsLabel.hidden = NO;
    }
    if (ripecropsAmount > 0) {
        _RipeCropsLabel.text = [NSString stringWithFormat:@"Ripe Crops: %i",ripecropsAmount];
        //_PlantedCropsLabel.hidden = NO;
    }
     */
    
    _PlantedCropsLabel.text = [NSString stringWithFormat:@"Crops Planted: %i",plantedcropsAmount];
    _RipeCropsLabel.text = [NSString stringWithFormat:@"Ripe Crops: %i",ripecropsAmount];
    currentcropsAmount = plantedcropsAmount + ripecropsAmount;
    _TotalCropsLabel.text = [NSString stringWithFormat:@"Total Crops: %i / %i",currentcropsAmount, maximumcropsAmount];
    _StatusUpdateLabel.text = CurrentStatusUpdate;
    _BackyardTextBox.text = ShelterCurrentText;
    _WoodLabel.text = [NSString stringWithFormat:@"Wood: %i", woodAmount];
    
    //Background
    if (fenceAmount == 1) {
        _BackyardBackground.image = [UIImage imageNamed: @"BackyardFence.png"];
    }
    else if (fenceAmount == 2) {
        _BackyardBackground.image = [UIImage imageNamed: @"BackyardFenceBarbed.png"];
    }
}

-(IBAction)ClickShelter:(id)sender{
    [self StopStatusTimers];
}

-(void)ContinueProgress6:(BOOL)InProgress{
    if (InProgress6 == YES) {
        pTimer6 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed6 target:self selector:@selector(UpdatePlantCropsProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress7:(BOOL)InProgress{
    if (InProgress7 == YES) {
        pTimer7 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed7 target:self selector:@selector(UpdateHarvestCropsProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress8:(BOOL)InProgress{
    if (InProgress8 == YES) {
        pTimer8 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed8 target:self selector:@selector(UpdateBurnWoodProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress9:(BOOL)InProgress{
    if (InProgress9 == YES) {
        pTimer9 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed9 target:self selector:@selector(UpdateCollectWaterProgress) userInfo:nil repeats:YES];
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
    [self SetUpBackyard];
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
    
    [prog6 setProgress:Prog6];
    [prog7 setProgress:Prog7];
    [prog8 setProgress:Prog8];
    [prog9 setProgress:Prog9];
    
    [health setProgress:Health];
    [food setProgress:Food];
    [water setProgress:Water];
    [self SetUpBackyard];

    
    healthTimer = [NSTimer scheduledTimerWithTimeInterval:HealthSpeed target:self selector:@selector(IncreaseHealth) userInfo:nil repeats:YES];
    foodTimer = [NSTimer scheduledTimerWithTimeInterval:FoodSpeed target:self selector:@selector(DecreaseFood) userInfo:nil repeats:YES];
    waterTimer = [NSTimer scheduledTimerWithTimeInterval:WaterSpeed target:self selector:@selector(DecreaseWater) userInfo:nil repeats:YES];
    
    WorkersTimerLR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateLR) userInfo:nil repeats:YES];
    WorkersTimerSR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateSR) userInfo:nil repeats:YES];
    
    CropUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateCrops) userInfo:nil repeats:YES];
    
    deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DeathCheck) userInfo:nil repeats:YES];
    FoodDecayTimer = [NSTimer scheduledTimerWithTimeInterval:fooddecayspeed target:self selector:@selector(DecayFood) userInfo:nil repeats:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [self ContinueProgress6:InProgress6];
    [self ContinueProgress7:InProgress7];
    [self ContinueProgress8:InProgress8];
    [self ContinueProgress9:InProgress9];
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
