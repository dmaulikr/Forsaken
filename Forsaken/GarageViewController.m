//
//  GarageViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "GarageViewController.h"
#import "AllSupplies.h"
#import "Workers.h"
#import "ProgressViews.h"

@interface GarageViewController ()

@end

@implementation GarageViewController





-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}



-(IBAction)ClickShelter:(id)sender{
    [self StopStatusTimers];
}

-(IBAction)ClickToolRack:(id)sender{
    [self StopStatusTimers];
}

-(IBAction)ClickWeapons:(id)sender{
    [self StopStatusTimers];
}

-(IBAction)ClickBuild:(id)sender{
    [self StopStatusTimers];
}

-(IBAction)ClickSupplyRuns:(id)sender{
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
    [self SetUpGarage];
}

- (void) WorkersUpdateSR{
    [Workers UpdateSRWorkersOutput];
    [self SetUpGarage];
}

-(void)UpdateCrops{
    [AllSupplies CropCounter];
}

-(void)DecayFood{
    [AllSupplies FoodDecay];
}

-(void)SetUpGarage{
    //Background
    if (electricityAmount > 0) {
        _GarageBackground.image = [UIImage imageNamed:@"GarageLight.png"];
    }
    else if (electricityAmount == 0) {
        _GarageBackground.image = [UIImage imageNamed:@"GarageDark.png"];
    }
    //Vehicles:
    if (bicycleAmount > 0) {
        _BicycleIcon.hidden = NO;
        _BicycleLabel.hidden = NO;
    }
    else {
        _BicycleIcon.hidden = YES;
        _BicycleLabel.hidden = YES;
    }
    if (motorcycleAmount > 0) {
        _MotorcycleIcon.hidden = NO;
        _MotorcycleLabel.hidden = NO;
        _MotorcycleButton.hidden = NO;
    }
    else {
        _MotorcycleIcon.hidden = YES;
        _MotorcycleLabel.hidden = YES;
        _MotorcycleButton.hidden = YES;
    }
    if (jeepAmount > 0) {
        _JeepIcon.hidden = NO;
        _JeepLabel.hidden = NO;
        _JeepButton.hidden = NO;
    }
    else {
        _JeepIcon.hidden = YES;
        _JeepLabel.hidden = YES;
        _JeepButton.hidden = YES;
    }
    if (electriccarAmount > 0) {
        _ElectricCarIcon.hidden = NO;
        _ElectricCarLabel.hidden = NO;
        _ElectricCarButton.hidden = NO;
    }
    else {
        _ElectricCarIcon.hidden = YES;
        _ElectricCarLabel.hidden = YES;
        _ElectricCarButton.hidden = YES;
    }
    if (hybridAmount > 0) {
        _HybridIcon.hidden = NO;
        _HybridLabel.hidden = NO;
        _HybridButton.hidden = NO;
    }
    else {
        _HybridIcon.hidden = YES;
        _HybridLabel.hidden = YES;
        _HybridButton.hidden = YES;
    }
    if (truckAmount > 0) {
        _TruckIcon.hidden = NO;
        _TruckLabel.hidden = NO;
        _TruckButton.hidden = NO;
    }
    else {
        _TruckIcon.hidden = YES;
        _TruckLabel.hidden = YES;
        _TruckButton.hidden = YES;
    }
    //Selected Vehicle
    if (motorcycleSelected == YES) {
        _MotorcycleLabel.textColor = [UIColor redColor];
    }
    else {
        _MotorcycleLabel.textColor = [UIColor blackColor];
    }
    if (jeepSelected == YES) {
        _JeepLabel.textColor = [UIColor redColor];
    }
    else {
        _JeepLabel.textColor = [UIColor blackColor];
    }
    if (electriccarSelected == YES) {
        _ElectricCarLabel.textColor = [UIColor redColor];
    }
    else {
        _ElectricCarLabel.textColor = [UIColor blackColor];
    }
    if (hybridSelected == YES) {
        _HybridLabel.textColor = [UIColor redColor];
    }
    else {
        _HybridLabel.textColor = [UIColor blackColor];
    }
    if (truckSelected == YES) {
        _TruckLabel.textColor = [UIColor redColor];
    }
    else {
        _TruckLabel.textColor = [UIColor blackColor];
    }
}

-(void)UpdateSRLabels{
    if (motorcycleSelected == YES) {
        //Grocery Store
        grocerystorefoodCost = 1;
        grocerystoregasolineCost = 1;
        grocerystorefoodAmount = 10;
        grocerystoresaltAmount = 10;
        grocerystorewaterAmount = 5;
        //Clothing Store
        clothingstorefoodCost = 1;
        clothingstoregasolineCost = 1;
        clothingstoreclothAmount = 5;
        clothingstorestringAmount = 10;
        //Pharmacy
        pharmacyfoodCost = 2;
        pharmacygasolineCost = 2;
        pharmacymedicineAmount = 10;
        //Hardware Store
        hardwarestorefoodCost = 3;
        hardwarestoregasolineCost = 3;
        hardwarestoremetalAmount = 1;
        hardwarestorescrewsAmount = 12;
        hardwarestorewiresAmount = 4;
        hardwarestorewoodAmount = 10;
        //Gas Station
        gasstationfoodCost = 4;
        gasstationgasolineCost = 4;
        gasstationgasolineAmount = 10;
    }
    else if (jeepSelected == YES) {
        //Grocery Store
        grocerystorefoodCost = 1;
        grocerystoregasolineCost = 2;
        grocerystorefoodAmount = 20;
        grocerystoresaltAmount = 20;
        grocerystorewaterAmount = 10;
        //Clothing Store
        clothingstorefoodCost = 1;
        clothingstoregasolineCost = 2;
        clothingstoreclothAmount = 10;
        clothingstorestringAmount = 20;
        //Pharmacy
        pharmacyfoodCost = 2;
        pharmacygasolineCost = 4;
        pharmacymedicineAmount = 20;
        //Hardware Store
        hardwarestorefoodCost = 3;
        hardwarestoregasolineCost = 6;
        hardwarestoremetalAmount = 2;
        hardwarestorescrewsAmount = 24;
        hardwarestorewiresAmount = 8;
        hardwarestorewoodAmount = 20;
        //Gas Station
        gasstationfoodCost = 4;
        gasstationgasolineCost = 8;
        gasstationgasolineAmount = 20;
    }
    else if (electriccarSelected == YES) {
        //Grocery Store
        grocerystorefoodCost = 1;
        grocerystoregasolineCost = 2;
        grocerystoreelectricityCost = 10;
        grocerystorefoodAmount = 15;
        grocerystoresaltAmount = 15;
        grocerystorewaterAmount = 8;
        //Clothing Store
        clothingstorefoodCost = 1;
        clothingstoregasolineCost = 2;
        clothingstoreelectricityCost = 10;
        clothingstoreclothAmount = 7;
        clothingstorestringAmount = 15;
        //Pharmacy
        pharmacyfoodCost = 2;
        pharmacygasolineCost = 4;
        pharmacyelectricityCost = 20;
        pharmacymedicineAmount = 15;
        //Hardware Store
        hardwarestorefoodCost = 3;
        hardwarestoregasolineCost = 6;
        hardwarestoreelectricityCost = 30;
        hardwarestoremetalAmount = 1;
        hardwarestorescrewsAmount = 18;
        hardwarestorewiresAmount = 6;
        hardwarestorewoodAmount = 15;
        //Gas Station
        gasstationfoodCost = 4;
        gasstationgasolineCost = 8;
        gasstationelectricityCost = 40;
        gasstationgasolineAmount = 15;
    }
    else if (hybridSelected == YES) {
        //Grocery Store
        grocerystorefoodCost = 1;
        grocerystoregasolineCost = 2;
        grocerystoreelectricityCost = 10;
        grocerystorefoodAmount = 20;
        grocerystoresaltAmount = 20;
        grocerystorewaterAmount = 10;
        //Clothing Store
        clothingstorefoodCost = 1;
        clothingstoregasolineCost = 2;
        clothingstoreelectricityCost = 10;
        clothingstoreclothAmount = 10;
        clothingstorestringAmount = 20;
        //Pharmacy
        pharmacyfoodCost = 2;
        pharmacygasolineCost = 4;
        pharmacyelectricityCost = 20;
        pharmacymedicineAmount = 20;
        //Hardware Store
        hardwarestorefoodCost = 3;
        hardwarestoregasolineCost = 6;
        hardwarestoreelectricityCost = 30;
        hardwarestoremetalAmount = 2;
        hardwarestorescrewsAmount = 24;
        hardwarestorewiresAmount = 8;
        hardwarestorewoodAmount = 20;
        //Gas Station
        gasstationfoodCost = 4;
        gasstationgasolineCost = 8;
        gasstationelectricityCost = 40;
        gasstationgasolineAmount = 20;
    }
    else if (truckSelected == YES) {
        //Grocery Store
        grocerystorefoodCost = 1;
        grocerystoregasolineCost = 4;
        grocerystorefoodAmount = 40;
        grocerystoresaltAmount = 40;
        grocerystorewaterAmount = 20;
        //Clothing Store
        clothingstorefoodCost = 1;
        clothingstoregasolineCost = 4;
        clothingstoreclothAmount = 20;
        clothingstorestringAmount = 40;
        //Pharmacy
        pharmacyfoodCost = 2;
        pharmacygasolineCost = 8;
        pharmacymedicineAmount = 40;
        //Hardware Store
        hardwarestorefoodCost = 3;
        hardwarestoregasolineCost = 12;
        hardwarestoremetalAmount = 4;
        hardwarestorescrewsAmount = 48;
        hardwarestorewiresAmount = 16;
        hardwarestorewoodAmount = 40;
        //Gas Station
        gasstationfoodCost = 4;
        gasstationgasolineCost = 16;
        gasstationgasolineAmount = 40;
    }
}

- (IBAction)MotorcycleButton:(id)sender {
    motorcycleSelected = YES;
    jeepSelected = NO;
    electriccarSelected = NO;
    hybridSelected = NO;
    truckSelected = NO;
    [self UpdateSRLabels];
    [self SetUpGarage];
}
- (IBAction)JeepButton:(id)sender{
    motorcycleSelected = NO;
    jeepSelected = YES;
    electriccarSelected = NO;
    hybridSelected = NO;
    truckSelected = NO;
    [self UpdateSRLabels];
    [self SetUpGarage];
}
- (IBAction)ElectricCarButton:(id)sender{
    motorcycleSelected = NO;
    jeepSelected = NO;
    electriccarSelected = YES;
    hybridSelected = NO;
    truckSelected = NO;
    [self UpdateSRLabels];
    [self SetUpGarage];
}
- (IBAction)HybridButton:(id)sender{
    motorcycleSelected = NO;
    jeepSelected = NO;
    electriccarSelected = NO;
    hybridSelected = YES;
    truckSelected = NO;
    [self UpdateSRLabels];
    [self SetUpGarage];
}
- (IBAction)TruckButton:(id)sender{
    motorcycleSelected = NO;
    jeepSelected = NO;
    electriccarSelected = NO;
    hybridSelected = NO;
    truckSelected = YES;
    [self UpdateSRLabels];
    [self SetUpGarage];
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
    
    [self SetUpGarage];
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
