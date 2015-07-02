//
//  BuildViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "BuildViewController.h"
#import "AllSupplies.h"
#import "ProgressViews.h"
#import "TextBox.h"
#import "Workers.h"

@interface BuildViewController ()

@end

@implementation BuildViewController


-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


-(IBAction)FenceButton:(id)sender{
    if (woodAmount >= fencewoodCost && nailsAmount >= fencenailsCost && fenceAmount < maximumfenceAmount && hammerAmount > 0) {
        fenceAmount += 1;
        woodAmount -= fencewoodCost;
        nailsAmount -= fencenailsCost;
        BuildCurrentText = [NSString stringWithFormat:@"Fence was built:\n - %i Wood\n - %i Nails", fencewoodCost, fencenailsCost];
    }
    else if (fenceAmount >= maximumfenceAmount){
        BuildCurrentText = @"Can't build any more fences.";
    }
    else if (hammerAmount == 0){
        BuildCurrentText = @"You are missing the following tools for this build:\n   Hammer";
    }
    else {
        BuildCurrentText = [NSString stringWithFormat:@"Not enough materials to build fence.\nRequires:\n   %i Wood\n   %i Nails\nYou need:\n   %i Wood\n   %i Nails", fencewoodCost, fencenailsCost, (fencewoodCost - woodAmount), (fencenailsCost - nailsAmount)];
    }
    [self SetUpBuild];
}

-(IBAction)BoardWindowsButton:(id)sender{
    if (woodAmount >= boardwindowswoodCost && nailsAmount >= boardwindowsnailsCost && boardwindowsAmount < maximumboardwindowsAmount && hammerAmount > 0) {
        boardwindowsAmount += 1;
        woodAmount -= boardwindowswoodCost;
        nailsAmount -= boardwindowsnailsCost;
        boardwindowsbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)RainCollectorButton:(id)sender{
    if (woodAmount >= raincollectorwoodCost && nailsAmount >= raincollectornailsCost && glassAmount >= raincollectorglassCost && raincollectorAmount < maximumraincollectorAmount && hammerAmount > 0) {
        raincollectorAmount += 1;
        woodAmount -= raincollectorwoodCost;
        nailsAmount -= raincollectornailsCost;
        glassAmount -= raincollectorglassCost;
    }
    [self SetUpBuild];
}

-(IBAction)FirePitButton:(id)sender{
    if (woodAmount >= 10 && firepitAmount == 0 && shovelAmount > 0) {
        firepitAmount += 1;
        woodAmount -= 10;
        firepitbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)ShackButton:(id)sender{
    if (woodAmount >= shackwoodCost && nailsAmount >= shacknailsCost && glassAmount >= shackglassCost && clothAmount >= shackclothCost && shackAmount < maximumshackAmount && hammerAmount > 0) {
        shackAmount += 1;
        woodAmount -= shackwoodCost;
        nailsAmount -= shacknailsCost;
        glassAmount -= shackglassCost;
        clothAmount -= shackclothCost;
        maximumworkersAmount += 4;
    }
    [self SetUpBuild];
}

-(IBAction)FridgeButton:(id)sender{
    if (metalAmount >= fridgemetalCost && wireAmount >= fridgewireCost && fridgeAmount == 0 && screwsAmount > fridgescrewsCost &&  blowtorchAmount > 0 && solderingironAmount > 0) {
        fridgeAmount = 1;
        metalAmount -= fridgemetalCost;
        wireAmount -= fridgewireCost;
        screwsAmount -= fridgescrewsCost;
        fridgebuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)SewingMachineButton:(id)sender{
    if (metalAmount >= sewingmachinemetalCost && wireAmount >= sewingmachinewireCost && sewingmachineAmount == 0 && screwsAmount >= sewingmachinescrewsCost  && solderingironAmount > 0) {
        sewingmachineAmount = 1;
        metalAmount -= sewingmachinemetalCost;
        wireAmount -= sewingmachinewireCost;
        screwsAmount -= sewingmachinescrewsCost;
        sewingmachinebuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)RadioButton:(id)sender{
    if (metalAmount >= radiometalCost && wireAmount >= radiowireCost && radioAmount == 0 && screwsAmount >= radioscrewsCost  && solderingironAmount > 0) {
        radioAmount = 1;
        metalAmount -= radiometalCost;
        wireAmount -= radiowireCost;
        screwsAmount -= radioscrewsCost;
        radiobuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)GasGeneratorButton:(id)sender{
    if (metalAmount >= gasgeneratormetalCost && wireAmount >= gasgeneratorwireCost && gasgeneratorAmount == 0 && screwsAmount >= gasgeneratorscrewsCost  && solderingironAmount > 0 && blowtorchAmount > 0 && batteriesAmount > gasgeneratorbatteriesCost) {
        gasgeneratorAmount = 1;
        metalAmount -= gasgeneratormetalCost;
        wireAmount -= gasgeneratorwireCost;
        screwsAmount -= gasgeneratorscrewsCost;
        batteriesAmount -= gasgeneratorbatteriesCost;
        gasgeneratorbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)ForgeButton:(id)sender{
    if (metalAmount >= forgemetalCost && forgeAmount == 0 && screwsAmount >= forgescrewsCost  && hammerAmount > 0) {
        forgeAmount = 1;
        metalAmount -= forgemetalCost;
        screwsAmount -= forgescrewsCost;
        forgebuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)BicycleButton:(id)sender{
    if (metalAmount >= bicyclemetalCost && rubberAmount >= bicyclerubberCost  && clothAmount > bicycleclothCost && screwsAmount >= bicyclescrewsCost && bicycleAmount == 0) {
        bicycleAmount = 1;
        metalAmount -= bicyclemetalCost;
        screwsAmount -= bicyclescrewsCost;
        clothAmount -= bicycleclothCost;
        rubberAmount -= bicyclerubberCost;
        bicyclebuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)MotorcycleButton:(id)sender{
    if (metalAmount >= motorcyclemetalCost && rubberAmount >= motorcyclerubberCost  && clothAmount > motorcycleclothCost && screwsAmount >= motorcyclescrewsCost && batteriesAmount >= motorcyclebatteriesCost && wireAmount >= motorcyclewireCost && glassAmount >= motorcycleglassCost && motorcycleAmount == 0) {
        motorcycleAmount = 1;
        metalAmount -= motorcyclemetalCost;
        screwsAmount -= motorcyclescrewsCost;
        clothAmount -= motorcycleclothCost;
        rubberAmount -= motorcyclerubberCost;
        batteriesAmount -= motorcyclebatteriesCost;
        wireAmount -= motorcyclewireCost;
        glassAmount -= motorcycleglassCost;
        bicyclebuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)JeepButton:(id)sender{
    if (metalAmount >= jeepmetalCost && rubberAmount >= jeeprubberCost  && clothAmount > jeepclothCost && screwsAmount >= jeepscrewsCost && batteriesAmount >= jeepbatteriesCost && wireAmount >= jeepwireCost && glassAmount >= jeepglassCost && jeepAmount == 0) {
        jeepAmount = 1;
        metalAmount -= jeepmetalCost;
        screwsAmount -= jeepscrewsCost;
        clothAmount -= jeepclothCost;
        rubberAmount -= jeeprubberCost;
        batteriesAmount -= jeepbatteriesCost;
        wireAmount -= jeepwireCost;
        glassAmount -= jeepglassCost;
        jeepbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)ElectricCarButton:(id)sender{
    if (metalAmount >= electriccarmetalCost && rubberAmount >= electriccarrubberCost  && clothAmount > electriccarclothCost && screwsAmount >= electriccarscrewsCost && batteriesAmount >= electriccarbatteriesCost && wireAmount >= electriccarwireCost && glassAmount >= electriccarglassCost && electriccarAmount == 0) {
        electriccarAmount = 1;
        metalAmount -= electriccarmetalCost;
        screwsAmount -= electriccarscrewsCost;
        clothAmount -= electriccarclothCost;
        rubberAmount -= electriccarrubberCost;
        batteriesAmount -= electriccarbatteriesCost;
        wireAmount -= electriccarwireCost;
        glassAmount -= electriccarglassCost;
        electriccarbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)HybridButton:(id)sender{
    if (metalAmount >= hybridmetalCost && rubberAmount >= hybridrubberCost  && clothAmount > hybridclothCost && screwsAmount >= hybridscrewsCost && batteriesAmount >= hybridbatteriesCost && wireAmount >= hybridwireCost && glassAmount >= hybridglassCost && hybridAmount == 0) {
        hybridAmount = 1;
        metalAmount -= hybridmetalCost;
        screwsAmount -= hybridscrewsCost;
        clothAmount -= hybridclothCost;
        rubberAmount -= hybridrubberCost;
        batteriesAmount -= hybridbatteriesCost;
        wireAmount -= hybridwireCost;
        glassAmount -= hybridglassCost;
        hybridbuttoncolor = 1;
    }
    [self SetUpBuild];
}

-(IBAction)TruckButton:(id)sender{
    if (metalAmount >= truckmetalCost && rubberAmount >= truckrubberCost  && clothAmount > truckclothCost && screwsAmount >= truckscrewsCost && batteriesAmount >= truckbatteriesCost && wireAmount >= truckwireCost && glassAmount >= truckglassCost && truckAmount == 0) {
        truckAmount = 1;
        metalAmount -= truckmetalCost;
        screwsAmount -= truckscrewsCost;
        clothAmount -= truckclothCost;
        rubberAmount -= truckrubberCost;
        batteriesAmount -= truckbatteriesCost;
        wireAmount -= truckwireCost;
        glassAmount -= truckglassCost;
        truckbuttoncolor = 1;
    }
    [self SetUpBuild];
}


-(void)SetUpBuild{
    //Background
    if (electricityAmount > 0) {
        _BuildBackground.image = [UIImage imageNamed: @"BuildLight.png"];
    }
    else {
        _BuildBackground.image = [UIImage imageNamed: @"BuildDark.png"];
    }
    //Text Box
    _BuildTextView.text = BuildCurrentText;
    //Fence
    _FenceCounterLabel.text = [NSString stringWithFormat:@"%i / %i", fenceAmount, maximumfenceAmount];
    if (fenceAmount < maximumfenceAmount) {
        [_FenceButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else if (fenceAmount == maximumfenceAmount) {
        [_FenceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //Rain Collector
    _RainCollectorCounterLabel.text = [NSString stringWithFormat:@"%i / %i", raincollectorAmount, maximumraincollectorAmount];
    if (raincollectorAmount < maximumraincollectorAmount) {
        [_RainCollectorButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else if (raincollectorAmount == maximumraincollectorAmount) {
        [_RainCollectorButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //Board Windows
    _BoardWindowsCounterLabel.text = [NSString stringWithFormat:@"%i / %i", boardwindowsAmount, maximumboardwindowsAmount];
    if (boardwindowsAmount < maximumboardwindowsAmount) {
        [_BoardWindowsButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else if (boardwindowsAmount == maximumboardwindowsAmount) {
        [_BoardWindowsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //Shack
    _ShackCounterLabel.text = [NSString stringWithFormat:@"%i / %i", shackAmount, maximumshackAmount];
    if (shackAmount < maximumshackAmount) {
        [_ShackButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else if (shackAmount == maximumshackAmount) {
        [_ShackButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //Vehicles
    if (bicycleAmount == 0) {
        [_BicycleButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (bicycleAmount > 0) {
        [_BicycleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (motorcycleAmount == 0) {
        [_MotorcycleButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (motorcycleAmount > 0) {
        [_MotorcycleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (jeepAmount == 0) {
        [_JeepButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (jeepAmount > 0) {
        [_JeepButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (electriccarAmount == 0) {
        [_ElectricCarButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (electriccarAmount > 0) {
        [_ElectricCarButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (hybridAmount == 0) {
        [_HybridButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (hybridAmount > 0) {
        [_HybridButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (truckAmount == 0) {
        [_TruckButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }
    else if (truckAmount > 0) {
        [_TruckButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    //Other
    if (firepitAmount == 0) {
        [_FirePitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (firepitAmount > 0){
        [_FirePitButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (fridgeAmount == 0) {
        [_FridgeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (fridgeAmount > 0){
        [_FridgeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (sewingmachineAmount == 0) {
        [_SewingMachineButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (sewingmachineAmount > 0){
        [_SewingMachineButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (radioAmount == 0) {
        [_RadioButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (radioAmount > 0){
        [_RadioButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (gasgeneratorAmount == 0) {
        [_GasGeneratorButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (gasgeneratorAmount > 0){
        [_GasGeneratorButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
    if (forgeAmount == 0) {
        [_ForgeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (forgeAmount > 0){
        [_ForgeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    
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
    [self SetUpBuild];
    
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
