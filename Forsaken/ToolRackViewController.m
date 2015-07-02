//
//  ToolRackViewController.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/22/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "ToolRackViewController.h"
#import "ProgressViews.h"
#import "AllSupplies.h"
#import "Workers.h"

@interface ToolRackViewController ()

@end

@implementation ToolRackViewController

-(void)DeathCheck{
    if (Health <= 0.0) {
        [self StopStatusTimers];
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"DeathScreen"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


- (IBAction)ClickShovel:(id)sender {
    if (metalscrapAmount > 0 && woodAmount > 2 && shovelAmount == 0) {
        shovelAmount = 1;
        metalscrapAmount -= 1;
        woodAmount -= 2;
        shovelbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickSaw:(id)sender {
    if (metalscrapAmount >= 2 && woodAmount >= 1 && sawAmount == 0) {
        sawAmount = 1;
        metalscrapAmount -= 2;
        woodAmount -= 1;
        sawbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickHammer:(id)sender {
    if (metalscrapAmount >= 1 && woodAmount >= 1 && hammerAmount == 0) {
        hammerAmount = 1;
        metalscrapAmount -= 1;
        woodAmount -= 1;
        hammerbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickBlowTorch:(id)sender {
    if (metalAmount >= 5 && wireAmount >= 2 && blowtorchAmount == 0) {
        blowtorchAmount = 1;
        metalAmount -= 5;
        wireAmount -= 2;
        blowtorchbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickChainSaw:(id)sender {
    if (metalAmount >= 10 && wireAmount >= 5 && batteriesAmount >= 4 && chainsawAmount == 0) {
        chainsawAmount = 1;
        metalAmount -= 10;
        wireAmount -= 5;
        batteriesAmount -= 4;
        chainsawbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickSolderingIron:(id)sender {
    if (metalAmount >= 5 && wireAmount >= 5 && solderingironAmount == 0) {
        solderingironAmount = 1;
        metalAmount -= 5;
        wireAmount -= 5;
        solderingironbuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickAxe:(id)sender {
    if (metalscrapAmount >= 2 && woodAmount >= 2 && axeAmount == 0) {
        axeAmount = 1;
        metalscrapAmount -= 2;
        woodAmount -= 2;
        axebuttoncolor = 1;
        [self SetUpToolRack];
    }
}

- (IBAction)ClickSickle:(id)sender {
    if (metalscrapAmount >= 2 && woodAmount >= 2 && sickleAmount == 0) {
        sickleAmount = 1;
        metalscrapAmount -= 2;
        woodAmount -= 2;
        sicklebuttoncolor = 1;
        [self SetUpToolRack];
    }
}



- (void)SetUpToolRack{
    //Background
    if (electricityAmount > 0) {
        _ToolRackBackground.image = [UIImage imageNamed: @"ToolRackLight.png"];
    }
    else {
        _ToolRackBackground.image = [UIImage imageNamed: @"ToolRackDark.png"];
    }
    
    //Coloring
    if (shovelbuttoncolor == 0) {
        [_ClickShovel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (shovelbuttoncolor == 1) {
        [_ClickShovel setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (sawbuttoncolor == 0) {
        [_ClickSaw setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (sawbuttoncolor == 1) {
        [_ClickSaw setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (hammerbuttoncolor == 0) {
        [_ClickHammer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (hammerbuttoncolor == 1) {
        [_ClickHammer setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (blowtorchbuttoncolor == 0) {
        [_ClickBlowTorch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (blowtorchbuttoncolor == 1) {
        [_ClickBlowTorch setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (chainsawbuttoncolor == 0) {
        [_ClickChainSaw setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (chainsawbuttoncolor == 1) {
        [_ClickChainSaw setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (solderingironbuttoncolor == 0) {
        [_ClickSolderingIron setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (solderingironbuttoncolor == 1) {
        [_ClickSolderingIron setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (axebuttoncolor == 0) {
        [_ClickAxe setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (axebuttoncolor == 1) {
        [_ClickAxe setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    if (sicklebuttoncolor == 0) {
        [_ClickSickle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (sicklebuttoncolor == 1) {
        [_ClickSickle setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
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
    [self SetUpToolRack];
    
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
