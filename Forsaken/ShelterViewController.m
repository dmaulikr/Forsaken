//
//  ShelterViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/20/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "ShelterViewController.h"
#import "AllSupplies.h"
#import "TextBox.h"
#import "ProgressViews.h"
#import "Workers.h"

@interface ShelterViewController ()

@end

@implementation ShelterViewController

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

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void)WorkersUpdateLR{
    [Workers UpdateLRWorkersOutput];
    [self SetUpShelter];
}

- (void) WorkersUpdateSR{
    [Workers UpdateSRWorkersOutput];
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
    [CropsTimer invalidate];
    [deathCheckTimer invalidate];
    [FoodDecayTimer invalidate];
}


- (IBAction)ClickKitchen:(id)sender {
    [self StopStatusTimers];
}

- (IBAction)ClickStoreRoom:(id)sender {
    [self StopStatusTimers];
}

- (IBAction)ClickGarage:(id)sender {
    [self StopStatusTimers];
}

- (IBAction)ClickLivingRoom:(id)sender {
    [self StopStatusTimers];
}

- (IBAction)ClickBackyard:(id)sender {
    [self StopStatusTimers];
}

- (IBAction)ClickStreet:(id)sender {
    [self StopStatusTimers];
}


-(void)UpdateCrops{
    [AllSupplies CropCounter];
}

-(void)DecayFood{
    [AllSupplies FoodDecay];
}


-(void)SetUpShelter{
    _StatusUpdateLabel.text = CurrentStatusUpdate;
    _ShelterTextBox.text = ShelterCurrentText;
    //Background
    if (electricityAmount > 0) {
        if (boardwindowsAmount > 0) {
            _ShelterBackground.image = [UIImage imageNamed: @"ShelterLightBoarded.png"];
        }
        else if (boardwindowsAmount == 0) {
            _ShelterBackground.image = [UIImage imageNamed: @"ShelterLightUnboarded.png"];
        }
    }
    else if (electricityAmount <= 0) {
        if (boardwindowsAmount > 0) {
            _ShelterBackground.image = [UIImage imageNamed: @"ShelterDarkBoarded.png"];
        }
        else if (boardwindowsAmount == 0) {
            _ShelterBackground.image = [UIImage imageNamed: @"ShelterDarkUnboarded.png"];
        }
    }
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
    
    [health setProgress:Health];
    [food setProgress:Food];
    [water setProgress:Water];
    
    [self SetUpShelter];
    
    healthTimer = [NSTimer scheduledTimerWithTimeInterval:HealthSpeed target:self selector:@selector(IncreaseHealth) userInfo:nil repeats:YES];
    foodTimer = [NSTimer scheduledTimerWithTimeInterval:FoodSpeed target:self selector:@selector(DecreaseFood) userInfo:nil repeats:YES];
    waterTimer = [NSTimer scheduledTimerWithTimeInterval:WaterSpeed target:self selector:@selector(DecreaseWater) userInfo:nil repeats:YES];
    
    WorkersTimerLR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateLR) userInfo:nil repeats:YES];
    WorkersTimerSR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateSR) userInfo:nil repeats:YES];
    
    CropsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateCrops) userInfo:nil repeats:YES];
    
    deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DeathCheck) userInfo:nil repeats:YES];
    FoodDecayTimer = [NSTimer scheduledTimerWithTimeInterval:fooddecayspeed target:self selector:@selector(DecayFood) userInfo:nil repeats:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    
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