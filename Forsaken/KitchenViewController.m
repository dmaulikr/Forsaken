//
//  KitchenViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/21/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "KitchenViewController.h"
#import "ProgressViews.h"
#import "TextBox.h"
#import "AllSupplies.h"
#import "Workers.h"

@interface KitchenViewController ()

@end

@implementation KitchenViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [healthTimer invalidate];
        //healthTimer = nil;
        [foodTimer invalidate];
        //foodTimer = nil;
        [waterTimer invalidate];
        //waterTimer = nil;
        [pTimer3 invalidate];
        [pTimer4 invalidate];
        [pTimer5 invalidate];
        //Workers
        [WorkersTimerLR invalidate];
        [WorkersTimerSR invalidate];
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


#pragma Buttons with progress views:
//Drink Water:
-(void)UpdateDrinkWaterProgress{
    if (prog3.progress < 1 && waterAmount > 0) {
        [prog3 setProgress:prog3.progress + ProgIncrement3];
        Prog3 += ProgIncrement3;
    }
    else if (prog3.progress >= 1 && waterAmount > 0){
        [pTimer3 invalidate];
        [prog3 setProgress:0.0];
        Prog3 = 0.0;
        InProgress3 = NO;
        //What the button does:
        waterAmount -= 1;
        [water setProgress:Water + WaterIncrementUp];
        Water += WaterIncrementUp;
        CurrentStatusUpdate =@"Your thirst was quenched.";
        ShelterCurrentText = [Message1 stringByAppendingString:ShelterCurrentText];
        ShelterCurrentText = [Message2 stringByAppendingString:ShelterCurrentText];
    }
    else {
        CurrentStatusUpdate =@"No water to drink.";
        [pTimer3 invalidate];
        InProgress3 = NO;
    }
    
    if (Water > 1.0) {
        [water setProgress:1.0];
        Water = 1.0;
    }
    [self SetUpKitchen];
}

-(IBAction)ClickDrinkWater:(id)sender{
    if (prog3.progress == 0 && InProgress3 == NO) {
        pTimer3 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed3 target:self selector:@selector(UpdateDrinkWaterProgress) userInfo:nil repeats:YES];
        InProgress3 = YES;
    }
    
}

//Eat Food:
-(void)UpdateEatFoodProgress{
    if (prog4.progress < 1 && (foodAmount > 0 || preservedfoodAmount > 0)) {
        [prog4 setProgress:prog4.progress + ProgIncrement4];
        Prog4 += ProgIncrement4;
    }
    else if (prog4.progress >= 1 && foodAmount > 0){
        [pTimer4 invalidate];
        [prog4 setProgress:0.0];
        Prog4 = 0.0;
        InProgress4 = NO;
        //What the button does:
        foodAmount -= 1;
        [food setProgress:food.progress + FoodIncrementUp];
        Food += FoodIncrementUp;
        CurrentStatusUpdate =@"Your hunger was satisfied.";
    }
    else if (prog4.progress >= 1 && preservedfoodAmount > 0){
        [pTimer4 invalidate];
        [prog4 setProgress:0.0];
        Prog4 = 0.0;
        InProgress4 = NO;
        //What the button does:
        preservedfoodAmount -= 1;
        [food setProgress:food.progress + FoodIncrementUp];
        Food += FoodIncrementUp;
        CurrentStatusUpdate =@"Your hunger was satisfied.";
    }

    else {
        CurrentStatusUpdate =@"No food to eat.";
        [pTimer4 invalidate];
        InProgress4 = NO;
    }
    
    if (Food > 1.0) {
        [food setProgress:1.0];
        Food = 1.0;
    }
    [self SetUpKitchen];
}

-(IBAction)ClickEatFood:(id)sender{
    if (prog4.progress == 0 && InProgress4 == NO) {
        pTimer4 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed4 target:self selector:@selector(UpdateEatFoodProgress) userInfo:nil repeats:YES];
        InProgress4 = YES;
    }
    
}

//Preserve Food:
-(void)UpdatePreserveFoodProgress{
    if (prog5.progress < 1 && foodAmount > 0 && saltAmount > 0) {
        [prog5 setProgress:prog5.progress + ProgIncrement5];
        Prog5 += ProgIncrement5;
    }
    else if (prog5.progress >= 1 && foodAmount > 0 && saltAmount > 0){
        [pTimer5 invalidate];
        [prog5 setProgress:0.0];
        Prog5 = 0.0;
        InProgress5 = NO;
        //What the button does:
        foodAmount -= 1;
        saltAmount -= 1;
        preservedfoodAmount += 1;
        CurrentStatusUpdate =@"The food was salted.";
    }
    else if (foodAmount < 1 && saltAmount < 1){
        CurrentStatusUpdate =@"No food or salt in storeroom.";
        [pTimer5 invalidate];
        InProgress5 = NO;
    }
    else if (foodAmount < 1){
        CurrentStatusUpdate =@"No food to preserve.";
        [pTimer5 invalidate];
        InProgress5 = NO;
    }
    else if (saltAmount < 1){
        CurrentStatusUpdate =@"No salt to preserve food.";
        [pTimer5 invalidate];
        InProgress5 = NO;
    }
    [self SetUpKitchen];
}

- (IBAction)ClickPreserveFood:(id)sender{
    if (prog5.progress == 0 && InProgress5 == NO) {
        pTimer5 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed5 target:self selector:@selector(UpdatePreserveFoodProgress) userInfo:nil repeats:YES];
        InProgress5 = YES;
    }
}


- (IBAction)ClickShelter:(id)sender {
    
    [healthTimer invalidate];
    //healthTimer = nil;
    [foodTimer invalidate];
    //foodTimer = nil;
    [waterTimer invalidate];
    //waterTimer = nil;
    [pTimer3 invalidate];
    [pTimer4 invalidate];
    [pTimer5 invalidate];
    //Workers
    [WorkersTimerLR invalidate];
    [WorkersTimerSR invalidate];
    //Food Decay
    [FoodDecayTimer invalidate];
}

-(void)ContinueProgress3:(BOOL)InProgress{
    if (InProgress3 == YES) {
        pTimer3 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed3 target:self selector:@selector(UpdateDrinkWaterProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress4:(BOOL)InProgress{
    if (InProgress4 == YES) {
        pTimer4 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed4 target:self selector:@selector(UpdateEatFoodProgress) userInfo:nil repeats:YES];
    }
}

-(void)ContinueProgress5:(BOOL)InProgress{
    if (InProgress5 == YES) {
        pTimer5 = [NSTimer scheduledTimerWithTimeInterval:ProgSpeed5 target:self selector:@selector(UpdatePreserveFoodProgress) userInfo:nil repeats:YES];
    }
}


- (void)WorkersUpdateLR{
    [Workers UpdateLRWorkersOutput];
    [self SetUpKitchen];
}

- (void) WorkersUpdateSR{
    [Workers UpdateSRWorkersOutput];
    [self SetUpKitchen];
}

-(void)UpdateCrops{
    [AllSupplies CropCounter];
}


-(void)DecayFood{
    [AllSupplies FoodDecay];
    [self SetUpKitchen];
}


-(void)SetUpKitchen{
    _StatusUpdateLabel.text = CurrentStatusUpdate;
    _KitchenTextBox.text = ShelterCurrentText;
    
    if (electricityAmount > 0) {
        _KitchenBackground.image = [UIImage imageNamed:@"KitchenLight.png"];
    }
    else if (electricityAmount == 0) {
        _KitchenBackground.image = [UIImage imageNamed:@"KitchenDark.png"];
    }
    //Labels
    _SaltLabel.text = [NSString stringWithFormat:@"Salt:\n%i", saltAmount];
    _WaterLabel.text = [NSString stringWithFormat:@"Water:\n%i", waterAmount];
    _FoodLabel.text = [NSString stringWithFormat:@"Food:\n%i", foodAmount];
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
    [self SetUpKitchen];
    
    [prog3 setProgress:Prog3];
    [prog4 setProgress:Prog4];
    [prog5 setProgress:Prog5];
    [health setProgress:Health];
    [food setProgress:Food];
    [water setProgress:Water];
    
    healthTimer = [NSTimer scheduledTimerWithTimeInterval:HealthSpeed target:self selector:@selector(IncreaseHealth) userInfo:nil repeats:YES];
    foodTimer = [NSTimer scheduledTimerWithTimeInterval:FoodSpeed target:self selector:@selector(DecreaseFood) userInfo:nil repeats:YES];
    waterTimer = [NSTimer scheduledTimerWithTimeInterval:WaterSpeed target:self selector:@selector(DecreaseWater) userInfo:nil repeats:YES];
    
    WorkersTimerLR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateLR) userInfo:nil repeats:YES];
    WorkersTimerSR = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(WorkersUpdateSR) userInfo:nil repeats:YES];
    
    CropUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(UpdateCrops) userInfo:nil repeats:YES];
    
    deathCheckTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(DeathCheck) userInfo:nil repeats:YES];
    FoodDecayTimer = [NSTimer scheduledTimerWithTimeInterval:fooddecayspeed target:self selector:@selector(DecayFood) userInfo:nil repeats:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self ContinueProgress3:InProgress3];
    [self ContinueProgress4:InProgress4];
    [self ContinueProgress5:InProgress5];
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
