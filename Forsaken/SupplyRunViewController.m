//
//  SupplyRunViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/23/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "SupplyRunViewController.h"
#import "Workers.h"
#import "AllSupplies.h"
#import "TextBox.h"
#import "ProgressViews.h"

@interface SupplyRunViewController ()

@end

@implementation SupplyRunViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

//Add Workers
- (IBAction)ClickAdd13:(id)sender{
    [Workers AddWorker13];
    LootHousesLabel.text = [NSString stringWithFormat:@"Loot Houses: %i", loothousesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd14:(id)sender{
    [Workers AddWorker14];
    LootCarsLabel.text = [NSString stringWithFormat:@"Loot Cars: %i", lootcarsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd15:(id)sender{
    [Workers AddWorker15];
    JunkyardLabel.text = [NSString stringWithFormat:@"Junkyard: %i", junkyardworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd16:(id)sender{
    [Workers AddWorker16];
    GroceryStoreLabel.text = [NSString stringWithFormat:@"Grocery Store: %i", grocerystoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd17:(id)sender{
    [Workers AddWorker17];
    HardwareStoreLabel.text = [NSString stringWithFormat:@"Hardware Store: %i", hardwarestoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd18:(id)sender{
    [Workers AddWorker18];
    PharmacyLabel.text = [NSString stringWithFormat:@"Pharmacy: %i", pharmacyworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd19:(id)sender{
    [Workers AddWorker19];
    ClothingStoreLabel.text = [NSString stringWithFormat:@"Clothing Store: %i", clothingstoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd20:(id)sender{
    [Workers AddWorker20];
    GasStationLabel.text = [NSString stringWithFormat:@"Gas Station: %i", gasstationworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}

//Subtract Workers
- (IBAction)ClickSubtract13:(id)sender{
    [Workers SubtractWorker13];
    LootHousesLabel.text = [NSString stringWithFormat:@"Loot Houses: %i", loothousesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract14:(id)sender{
    [Workers SubtractWorker14];
    LootCarsLabel.text = [NSString stringWithFormat:@"Loot Cars: %i", lootcarsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract15:(id)sender{
    [Workers SubtractWorker15];
    JunkyardLabel.text = [NSString stringWithFormat:@"Junkyard: %i", junkyardworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract16:(id)sender{
    [Workers SubtractWorker16];
    GroceryStoreLabel.text = [NSString stringWithFormat:@"Grocery Store: %i", grocerystoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract17:(id)sender{
    [Workers SubtractWorker17];
    HardwareStoreLabel.text = [NSString stringWithFormat:@"Hardware Store: %i", hardwarestoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract18:(id)sender{
    [Workers SubtractWorker18];
    PharmacyLabel.text = [NSString stringWithFormat:@"Pharmacy: %i", pharmacyworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract19:(id)sender{
    [Workers SubtractWorker19];
    ClothingStoreLabel.text = [NSString stringWithFormat:@"Clothing Store: %i", clothingstoreworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract20:(id)sender{
    [Workers SubtractWorker20];
    GasStationLabel.text = [NSString stringWithFormat:@"Gas Station: %i", gasstationworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}

-(void)SetUpSRLabels{
    //Background
    if (electricityAmount > 0) {
        _SupplyRunBackground.image = [UIImage imageNamed: @"SupplyRunLight.png"];
    }
    else {
        _SupplyRunBackground.image = [UIImage imageNamed: @"SupplyRunDark.png"];
    }
    //Labels
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
    LootHousesLabel.text = [NSString stringWithFormat:@"Loot Houses: %i", loothousesworkersAmount];
    LootCarsLabel.text = [NSString stringWithFormat:@"Loot Cars: %i", lootcarsworkersAmount];
    JunkyardLabel.text = [NSString stringWithFormat:@"Junkyard: %i", junkyardworkersAmount];
    GroceryStoreLabel.text = [NSString stringWithFormat:@"Grocery Store: %i", grocerystoreworkersAmount];
    HardwareStoreLabel.text = [NSString stringWithFormat:@"Hardware Store: %i", hardwarestoreworkersAmount];
    PharmacyLabel.text = [NSString stringWithFormat:@"Pharmacy: %i", pharmacyworkersAmount];
    ClothingStoreLabel.text = [NSString stringWithFormat:@"Clothing Store: %i", clothingstoreworkersAmount];
    GasStationLabel.text = [NSString stringWithFormat:@"Gas Station: %i", gasstationworkersAmount];
    
    if (electriccarSelected == YES || hybridSelected == YES) {
        _GroceryStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Elect.", grocerystorefoodCost, grocerystoreelectricityCost];
        _ClothingStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Elect.", clothingstorefoodCost, clothingstoreelectricityCost];
        _PharmacyCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Elect.", pharmacyfoodCost, pharmacyelectricityCost];
        _HardwareStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Elect.", hardwarestorefoodCost, hardwarestoreelectricityCost];
        _GasStationCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Elect.", gasstationfoodCost, gasstationelectricityCost];
    }
    else {
        _GroceryStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Gas", grocerystorefoodCost, grocerystoregasolineCost];
        _ClothingStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Gas", clothingstorefoodCost, clothingstoregasolineCost];
        _PharmacyCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Gas", pharmacyfoodCost, pharmacygasolineCost];
        _HardwareStoreCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Gas", hardwarestorefoodCost, hardwarestoregasolineCost];
        _GasStationCostLabel.text = [NSString stringWithFormat:@"- %i Food   - %i Gas", gasstationfoodCost, gasstationgasolineCost];
    }
    
    
    
    _GroceryStoreGainLabel1.text = [NSString stringWithFormat:@"+ %i Food   + %i Salt", grocerystorefoodAmount, grocerystoresaltAmount];
    _GroceryStoreGainLabel2.text = [NSString stringWithFormat:@"+ %i Water", grocerystorewaterAmount];
    
    _ClothingStoreGainLabel1.text = [NSString stringWithFormat:@"+ %i Cloth   + %i String", clothingstoreclothAmount, clothingstorestringAmount];
    
    _PharmacyGainLabel1.text = [NSString stringWithFormat:@"+ %i Medicine", pharmacymedicineAmount];
    
    
    _HardwareStoreGainLabel1.text = [NSString stringWithFormat:@"+ %i Metal  + %i Screws", hardwarestoremetalAmount, hardwarestorescrewsAmount];
    _HardwareStoreGainLabel2.text = [NSString stringWithFormat:@"+ %i Wires  + %i Wood", hardwarestorewiresAmount, hardwarestorewoodAmount];
    
    _GasStationGainLabel1.text = [NSString stringWithFormat:@"+ %i Gasoline", gasstationgasolineAmount];
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
    [self SetUpSRLabels];
    
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
