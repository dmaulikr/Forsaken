//
//  SupplyViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/18/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "SupplyViewController.h"
#import "AllSupplies.h"
#import "Workers.h"
#import "ProgressViews.h"

@interface SupplyViewController ()

@end

@implementation SupplyViewController


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
 
-(void)SetUpSuppliesTable{
    //Background
    if (electricityAmount > 0) {
        _StoreRoomBackground.image = [UIImage imageNamed: @"StoreRoomLight.png"];
    }
    else if (electricityAmount <= 0) {
        _StoreRoomBackground.image = [UIImage imageNamed: @"StoreRoomDark.png"];
    }
    
    //Labels
    if (woodAmount > 0) {
        WoodLabel.hidden = NO;
    }
    WoodLabel.text = [NSString stringWithFormat:@"Wood: %i",woodAmount];
    
    if (nailsAmount > 0) {
        NailsLabel.hidden = NO;
    }
    NailsLabel.text = [NSString stringWithFormat:@"Nails: %i",nailsAmount];
    
    if (charcoalAmount > 0) {
        CharcoalLabel.hidden = NO;
    }
    CharcoalLabel.text = [NSString stringWithFormat:@"Charcoal: %i",charcoalAmount];
    
    if (gasolineAmount > 0) {
        GasolineLabel.hidden = NO;
    }
    GasolineLabel.text = [NSString stringWithFormat:@"Gasoline: %i",gasolineAmount];
    
    if (foodAmount > 0) {
        FoodLabel.hidden = NO;
    }
    FoodLabel.text = [NSString stringWithFormat:@"Food: %i",foodAmount];
    
    if (waterAmount > 0) {
        WaterLabel.hidden = NO;
    }
    WaterLabel.text = [NSString stringWithFormat:@"Water: %i",waterAmount];
    
    if (wireAmount > 0) {
        WireLabel.hidden = NO;
    }
    WireLabel.text = [NSString stringWithFormat:@"Wire: %i", wireAmount];
    
    if (clothAmount > 0) {
        ClothLabel.hidden = NO;
    }
    ClothLabel.text = [NSString stringWithFormat:@"Cloth: %i",clothAmount];
    
    if (metalscrapAmount > 0) {
        MetalScrapLabel.hidden = NO;
    }
    MetalScrapLabel.text = [NSString stringWithFormat:@"Metal Scrap: %i",metalscrapAmount];
    
    if (screwsAmount > 0) {
        ScrewsLabel.hidden = NO;
    }
    ScrewsLabel.text = [NSString stringWithFormat:@"Screws: %i",screwsAmount];
    
    if (rubberAmount > 0) {
        RubberLabel.hidden = NO;
    }
    RubberLabel.text = [NSString stringWithFormat:@"Rubber: %i",rubberAmount];
    
    if (metalAmount > 0) {
        MetalLabel.hidden = NO;
    }
    MetalLabel.text = [NSString stringWithFormat:@"Metal: %i",metalAmount];
    
    if (medicineAmount > 0) {
        MedicineLabel.hidden = NO;
    }
    MedicineLabel.text = [NSString stringWithFormat:@"Medicine: %i",medicineAmount];
    
    if (saltAmount > 0) {
        SaltLabel.hidden = NO;
    }
    SaltLabel.text = [NSString stringWithFormat:@"Salt: %i",saltAmount];
    
    if (stringAmount > 0) {
        StringLabel.hidden = NO;
    }
    StringLabel.text = [NSString stringWithFormat:@"String: %i",stringAmount];
    
    if (glassAmount > 0) {
        GlassLabel.hidden = NO;
    }
    GlassLabel.text = [NSString stringWithFormat:@"Glass: %i",glassAmount];
    
    if (electricityAmount > 0) {
        ElectricityLabel.hidden = NO;
    }
    ElectricityLabel.text = [NSString stringWithFormat:@"Electricity: %i",electricityAmount];
    
    if (batteriesAmount > 0) {
        BatteriesLabel.hidden = NO;
    }
    BatteriesLabel.text = [NSString stringWithFormat:@"Batteries: %i",batteriesAmount];
    
    if (preservedfoodAmount > 0) {
        PreservedFoodLabel.hidden = NO;
    }
    PreservedFoodLabel.text = [NSString stringWithFormat:@"Preserved Food:\n%i",preservedfoodAmount];
    
    if (seedsAmount > 0) {
        SeedsLabel.hidden = NO;
    }
    SeedsLabel.text = [NSString stringWithFormat:@"Seeds: %i",seedsAmount];
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
    //[self SetUpSuppliesTable];
}

- (void) WorkersUpdateSR{
    [Workers UpdateSRWorkersOutput];
    //[self SetUpSuppliesTable];
}

-(void)UpdateCrops{
    [AllSupplies CropCounter];
    [self SetUpSuppliesTable];
}

-(void)DecayFood{
    [AllSupplies FoodDecay];
    [self SetUpSuppliesTable];
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
    [self SetUpSuppliesTable];
    
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
