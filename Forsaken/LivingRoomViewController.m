//
//  LivingRoomViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/23/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "LivingRoomViewController.h"
#import "Workers.h"
#import "AllSupplies.h"
#import "ProgressViews.h"
#import "TextBox.h"

@interface LivingRoomViewController ()

@end

@implementation LivingRoomViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


//Add Workers
- (IBAction)ClickAdd1:(id)sender{
    [Workers AddWorker1];
    PreserveFoodLabel.text = [NSString stringWithFormat:@"Preserve Food: %i", preservefoodworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd2:(id)sender{
    [Workers AddWorker2];
    BurnWoodLabel.text = [NSString stringWithFormat:@"Burn Wood: %i", burnwoodworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd3:(id)sender{
    [Workers AddWorker3];
    CollectWaterLabel.text = [NSString stringWithFormat:@"Collect Water: %i", collectwaterworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd4:(id)sender{
    [Workers AddWorker4];
    PlantCropsLabel.text = [NSString stringWithFormat:@"Plant Crops: %i", plantcropsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd5:(id)sender{
    [Workers AddWorker5];
    HarvestCropsLabel.text = [NSString stringWithFormat:@"Harvest Crops: %i", harvestcropsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd6:(id)sender{
    [Workers AddWorker6];
    ChopTreesLabel.text = [NSString stringWithFormat:@"Chop Trees: %i", choptreesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd7:(id)sender{
    [Workers AddWorker7];
    PurifyMetalLabel.text = [NSString stringWithFormat:@"Purify Metal: %i", purifymetalworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd8:(id)sender{
    [Workers AddWorker8];
    GuardShelterLabel.text = [NSString stringWithFormat:@"Guard Shelter: %i", guardshelterworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd9:(id)sender{
    [Workers AddWorker9];
    HealMeLabel.text = [NSString stringWithFormat:@"Heal Me: %i", healmeworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd10:(id)sender{
    [Workers AddWorker10];
    SewClothLabel.text = [NSString stringWithFormat:@"Sew Cloth: %i", sewclothworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd11:(id)sender{
    [Workers AddWorker11];
    MakeBatteriesLabel.text = [NSString stringWithFormat:@"Make Batteries: %i", makebatteriesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickAdd12:(id)sender{
    [Workers AddWorker12];
    FuelGeneratorLabel.text = [NSString stringWithFormat:@"Fuel Generator: %i", fuelgeneratorworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}

//Subtract Workers
- (IBAction)ClickSubtract1:(id)sender{
    [Workers SubtractWorker1];
    PreserveFoodLabel.text = [NSString stringWithFormat:@"Preserve Food: %i", preservefoodworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract2:(id)sender{
    [Workers SubtractWorker2];
    BurnWoodLabel.text = [NSString stringWithFormat:@"Burn Wood: %i", burnwoodworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract3:(id)sender{
    [Workers SubtractWorker3];
    CollectWaterLabel.text = [NSString stringWithFormat:@"Collect Water: %i", collectwaterworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract4:(id)sender{
    [Workers SubtractWorker4];
    PlantCropsLabel.text = [NSString stringWithFormat:@"Plant Crops: %i", plantcropsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract5:(id)sender{
    [Workers SubtractWorker5];
    HarvestCropsLabel.text = [NSString stringWithFormat:@"Harvest Crops: %i", harvestcropsworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract6:(id)sender{
    [Workers SubtractWorker6];
    ChopTreesLabel.text = [NSString stringWithFormat:@"Chop Trees: %i", choptreesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract7:(id)sender{
    [Workers SubtractWorker7];
    PurifyMetalLabel.text = [NSString stringWithFormat:@"Purify Metal: %i", purifymetalworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract8:(id)sender{
    [Workers SubtractWorker8];
    GuardShelterLabel.text = [NSString stringWithFormat:@"Guard Shelter: %i", guardshelterworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract9:(id)sender{
    [Workers SubtractWorker9];
    HealMeLabel.text = [NSString stringWithFormat:@"Heal Me: %i", healmeworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract10:(id)sender{
    [Workers SubtractWorker10];
    SewClothLabel.text = [NSString stringWithFormat:@"Sew Cloth: %i", sewclothworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract11:(id)sender{
    [Workers SubtractWorker11];
    MakeBatteriesLabel.text = [NSString stringWithFormat:@"Make Batteries: %i", makebatteriesworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}
- (IBAction)ClickSubtract12:(id)sender{
    [Workers SubtractWorker12];
    FuelGeneratorLabel.text = [NSString stringWithFormat:@"Fuel Generator: %i", fuelgeneratorworkersAmount];
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
}


-(void)SetUpLivingRoomLabels{
    //Background
    if (electricityAmount > 0) {
        _LivingRoomBackground.image = [UIImage imageNamed: @"LivingRoomLight.png"];
    }
    else {
        _LivingRoomBackground.image = [UIImage imageNamed: @"LivingRoomDark.png"];
    }
    //Labels
    UnoccupiedWorkersLabel.text = [NSString stringWithFormat:@"Unoccupied Workers: %i / %i", freeworkersAmount, totalworkersAmount];
    PreserveFoodLabel.text = [NSString stringWithFormat:@"Preserve Food: %i", preservefoodworkersAmount];
    BurnWoodLabel.text = [NSString stringWithFormat:@"Burn Wood: %i", burnwoodworkersAmount];
    CollectWaterLabel.text = [NSString stringWithFormat:@"Collect Water: %i", collectwaterworkersAmount];
    PlantCropsLabel.text = [NSString stringWithFormat:@"Plant Crops: %i", plantcropsworkersAmount];
    HarvestCropsLabel.text = [NSString stringWithFormat:@"Harvest Crops: %i", harvestcropsworkersAmount];
    ChopTreesLabel.text = [NSString stringWithFormat:@"Chop Trees: %i", choptreesworkersAmount];
    PurifyMetalLabel.text = [NSString stringWithFormat:@"Purify Metal: %i", purifymetalworkersAmount];
    GuardShelterLabel.text = [NSString stringWithFormat:@"Guard Shelter: %i", guardshelterworkersAmount];
    HealMeLabel.text = [NSString stringWithFormat:@"Heal Me: %i", healmeworkersAmount];
    SewClothLabel.text = [NSString stringWithFormat:@"Sew Cloth: %i", sewclothworkersAmount];
    MakeBatteriesLabel.text = [NSString stringWithFormat:@"Make Batteries: %i", makebatteriesworkersAmount];
    FuelGeneratorLabel.text = [NSString stringWithFormat:@"Fuel Generator: %i", fuelgeneratorworkersAmount];
    
    CollectWaterGainLabel.text = [NSString stringWithFormat:@"+ %i Water", raincollectorAmount];
    HarvestCropsGainLabel2.text = [NSString stringWithFormat:@"+ Food = Ripe Crops\n               x %i", (1 + sickleAmount)];
    ChopTreesGainLabel.text = [NSString stringWithFormat:@"+ %i Wood", (2*(1+chainsawAmount))];
    
}




-(IBAction)ClickShelter:(id)sender{
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
    [self SetUpLivingRoomLabels];
    
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
