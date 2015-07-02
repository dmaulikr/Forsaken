//
//  AllSupplies.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/18/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "AllSupplies.h"


@implementation AllSupplies

int woodAmount = 120;
int nailsAmount = 50;
int charcoalAmount = 1000;
int gasolineAmount = 1000;
int foodAmount = 1000;
int waterAmount = 1000;
int clothAmount = 1000;
int wireAmount = 1000;
int metalscrapAmount = 1000;
int screwsAmount = 1000;
int metalAmount = 1000;
int medicineAmount = 1000;
int rubberAmount = 1000;
int stringAmount = 1000;
int saltAmount = 1000;
int electricityAmount = 10;
int glassAmount = 1000;
int batteriesAmount = 1000;
int preservedfoodAmount = 1000;
int seedsAmount = 1000;

int maximumelectricityAmount = 100;

//Food Decay
int fooddecayspeed = 1;//Don't change
int fooddecayspeed2 = 30;
float fooddecaypercentage = 0.10;
float fridgedecaypercentage = 0.01;
int fooddecaycounter = 0;

//Crops
int plantedcropsAmount = 0;
int ripecropsAmount = 0;
int maximumcropsAmount = 20;
int currentcropsAmount = 0;

int cropgrowthrate = 10;

bool cropspot1 = NO;
bool cropspot2 = NO;
bool cropspot3 = NO;
bool cropspot4 = NO;
bool cropspot5 = NO;
bool cropspot6 = NO;
bool cropspot7 = NO;
bool cropspot8 = NO;
bool cropspot9 = NO;
bool cropspot10 = NO;
bool cropspot11 = NO;
bool cropspot12 = NO;
bool cropspot13 = NO;
bool cropspot14 = NO;
bool cropspot15 = NO;
bool cropspot16 = NO;
bool cropspot17 = NO;
bool cropspot18 = NO;
bool cropspot19 = NO;
bool cropspot20 = NO;

int cropcounter1 = 0;
int cropcounter2 = 0;
int cropcounter3 = 0;
int cropcounter4 = 0;
int cropcounter5 = 0;
int cropcounter6 = 0;
int cropcounter7 = 0;
int cropcounter8 = 0;
int cropcounter9 = 0;
int cropcounter10 = 0;
int cropcounter11 = 0;
int cropcounter12 = 0;
int cropcounter13 = 0;
int cropcounter14 = 0;
int cropcounter15 = 0;
int cropcounter16 = 0;
int cropcounter17 = 0;
int cropcounter18 = 0;
int cropcounter19 = 0;
int cropcounter20 = 0;

+(void)CropCounter{
    if (cropspot1 == YES) {
        cropcounter1 += 1;
    }
    if (cropcounter1 >= cropgrowthrate) {
        cropspot1 = NO;
        cropcounter1 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot2 == YES) {
        cropcounter2 += 1;
    }
    if (cropcounter2 >= cropgrowthrate) {
        cropspot2 = NO;
        cropcounter2 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot3 == YES) {
        cropcounter3 += 1;
    }
    if (cropcounter3 >= cropgrowthrate) {
        cropspot3 = NO;
        cropcounter3 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot4 == YES) {
        cropcounter4 += 1;
    }
    if (cropcounter4 >= cropgrowthrate) {
        cropspot4 = NO;
        cropcounter4 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot5 == YES) {
        cropcounter5 += 1;
    }
    if (cropcounter5 >= cropgrowthrate) {
        cropspot5 = NO;
        cropcounter5 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot6 == YES) {
        cropcounter6 += 1;
    }
    if (cropcounter6 >= cropgrowthrate) {
        cropspot6 = NO;
        cropcounter6 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot7 == YES) {
        cropcounter7 += 1;
    }
    if (cropcounter7 >= cropgrowthrate) {
        cropspot7 = NO;
        cropcounter7 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot8 == YES) {
        cropcounter8 += 1;
    }
    if (cropcounter8 >= cropgrowthrate) {
        cropspot8 = NO;
        cropcounter8 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot9 == YES) {
        cropcounter9 += 1;
    }
    if (cropcounter9 >= cropgrowthrate) {
        cropspot9 = NO;
        cropcounter9 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot10 == YES) {
        cropcounter10 += 1;
    }
    if (cropcounter10 >= cropgrowthrate) {
        cropspot10 = NO;
        cropcounter10 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot11 == YES) {
        cropcounter11 += 1;
    }
    if (cropcounter11 >= cropgrowthrate) {
        cropspot11 = NO;
        cropcounter11 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot12 == YES) {
        cropcounter12 += 1;
    }
    if (cropcounter12 >= cropgrowthrate) {
        cropspot12 = NO;
        cropcounter12 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot13 == YES) {
        cropcounter13 += 1;
    }
    if (cropcounter13 >= cropgrowthrate) {
        cropspot13 = NO;
        cropcounter13 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot14 == YES) {
        cropcounter14 += 1;
    }
    if (cropcounter14 >= cropgrowthrate) {
        cropspot14 = NO;
        cropcounter14 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot15 == YES) {
        cropcounter15 += 1;
    }
    if (cropcounter15 >= cropgrowthrate) {
        cropspot15 = NO;
        cropcounter15 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot16 == YES) {
        cropcounter16 += 1;
    }
    if (cropcounter16 >= cropgrowthrate) {
        cropspot16 = NO;
        cropcounter16 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot17 == YES) {
        cropcounter17 += 1;
    }
    if (cropcounter17 >= cropgrowthrate) {
        cropspot17 = NO;
        cropcounter17 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot18 == YES) {
        cropcounter18 += 1;
    }
    if (cropcounter18 >= cropgrowthrate) {
        cropspot18 = NO;
        cropcounter18 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot19 == YES) {
        cropcounter19 += 1;
    }
    if (cropcounter19 >= cropgrowthrate) {
        cropspot19 = NO;
        cropcounter19 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
    
    if (cropspot20 == YES) {
        cropcounter20 += 1;
    }
    if (cropcounter20 >= cropgrowthrate) {
        cropspot20 = NO;
        cropcounter20 = 0;
        plantedcropsAmount -= 1;
        ripecropsAmount += 1;
    }
}

+(void)CropPlacer{
    if (cropspot1 == NO) {
        cropspot1 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot2 == NO) {
        cropspot2 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot3 == NO) {
        cropspot3 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot4 == NO) {
        cropspot4 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot5 == NO) {
        cropspot5 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot6 == NO) {
        cropspot6 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot7 == NO) {
        cropspot7 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot8 == NO) {
        cropspot8 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot9 == NO) {
        cropspot9 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot10 == NO) {
        cropspot10 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot11 == NO) {
        cropspot11 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot12 == NO) {
        cropspot12 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot13 == NO) {
        cropspot13 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot14 == NO) {
        cropspot14 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot15 == NO) {
        cropspot15 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot16 == NO) {
        cropspot16 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot17 == NO) {
        cropspot17 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot18 == NO) {
        cropspot18 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot19 == NO) {
        cropspot19 = YES;
        plantedcropsAmount += 1;
    }
    else if (cropspot20 == NO) {
        cropspot20 = YES;
        plantedcropsAmount += 1;
    }
}

//Security
int securityAmount = 0;

//Tools
int shovelAmount = 0;
int sawAmount = 0;
int hammerAmount = 0;
int blowtorchAmount = 0;
int chainsawAmount = 0;
int solderingironAmount = 0;
int axeAmount = 0;
int sickleAmount = 0;

int shovelbuttoncolor = 0;
int sawbuttoncolor = 0;
int hammerbuttoncolor = 0;
int blowtorchbuttoncolor = 0;
int chainsawbuttoncolor = 0;
int solderingironbuttoncolor = 0;
int axebuttoncolor = 0;


//Vehicles
int bicycleAmount = 0;
int motorcycleAmount = 0;
int jeepAmount = 0;
int electriccarAmount = 0;
int hybridAmount = 0;
int truckAmount = 0;

BOOL motorcycleSelected = NO;
BOOL jeepSelected = NO;
BOOL electriccarSelected = NO;
BOOL hybridSelected = NO;
BOOL truckSelected = NO;

int bicyclebuttoncolor = 0;
int motorcyclebuttoncolor = 0;
int jeepbuttoncolor = 0;
int electriccarbuttoncolor = 0;
int hybridbuttoncolor = 0;
int truckbuttoncolor = 0;


//Weapons
int clubAmount = 0;
int spikedclubAmount = 0;
int longbowAmount = 0;
int maceAmount = 0;
int macheteAmount = 0;
int pistolAmount = 0;
int shotgunAmount = 0;
int sniperAmount = 0;

//Builds
int fenceAmount = 0;
int boardwindowsAmount = 0;
int raincollectorAmount = 0;
int firepitAmount = 0;
int shackAmount = 0;
int fridgeAmount = 0;
int sewingmachineAmount = 0;
int radioAmount = 0;
int gasgeneratorAmount = 0;
int forgeAmount = 0;

int fencebuttoncolor = 0;
int boardwindowsbuttoncolor = 0;
int raincollectorbuttoncolor = 0;
int firepitbuttoncolor = 0;
int shackbuttoncolor = 0;
int fridgebuttoncolor = 0;
int sewingmachinebuttoncolor = 0;
int radiobuttoncolor = 0;
int gasgeneratorbuttoncolor = 0;
int forgebuttoncolor = 0;

int maximumraincollectorAmount = 5;
int maximumshackAmount = 25;
int maximumboardwindowsAmount = 2;
int maximumfenceAmount = 3;

int fencewoodCost = 100;
int fencenailsCost = 50;

int boardwindowswoodCost = 20;
int boardwindowsnailsCost = 10;

int raincollectorwoodCost = 10;
int raincollectornailsCost = 5;
int raincollectorglassCost = 10;

int firepitwoodCost = 10;

int shackwoodCost = 100;
int shacknailsCost = 50;
int shackglassCost = 20;
int shackclothCost = 50;

int fridgemetalCost = 30;
int fridgewireCost = 20;
int fridgescrewsCost = 20;

int sewingmachinemetalCost = 15;
int sewingmachinewireCost = 10;
int sewingmachinescrewsCost = 10;

int radiometalCost = 20;
int radiowireCost = 15;
int radioscrewsCost = 15;

int gasgeneratormetalCost = 40;
int gasgeneratorwireCost = 20;
int gasgeneratorscrewsCost = 20;
int gasgeneratorbatteriesCost = 20;

int forgemetalCost = 15;
int forgescrewsCost = 10;

int bicyclemetalCost = 20;
int bicyclescrewsCost = 10;
int bicycleclothCost = 2;
int bicyclerubberCost = 20;

int motorcyclemetalCost = 40;
int motorcyclescrewsCost = 30;
int motorcycleclothCost = 10;
int motorcyclebatteriesCost = 40;
int motorcyclewireCost = 20;
int motorcycleglassCost = 10;
int motorcyclerubberCost = 30;

int jeepmetalCost = 75;
int jeepscrewsCost = 50;
int jeepclothCost = 20;
int jeeprubberCost = 60;
int jeepbatteriesCost = 30;
int jeepwireCost = 40;
int jeepglassCost = 30;

int electriccarmetalCost = 60;
int electriccarscrewsCost = 40;
int electriccarclothCost = 15;
int electriccarrubberCost = 50;
int electriccarbatteriesCost = 50;
int electriccarwireCost = 50;
int electriccarglassCost = 20;

int hybridmetalCost = 75;
int hybridscrewsCost = 50;
int hybridclothCost = 20;
int hybridrubberCost = 60;
int hybridbatteriesCost = 40;
int hybridwireCost = 40;
int hybridglassCost = 25;

int truckmetalCost = 100;
int truckscrewsCost = 75;
int truckclothCost = 30;
int truckrubberCost = 80;
int truckbatteriesCost = 30;
int truckwireCost = 50;
int truckglassCost = 30;







+(void)FoodDecay{
    fooddecaycounter += 1;
    if (fooddecaycounter >= fooddecayspeed2) {
        if (fridgeAmount > 0) {
            fooddecaypercentage = fridgedecaypercentage;
        }
        roundedfooddecay = ceilf(foodAmount *fooddecaypercentage);
        foodAmount -= roundedfooddecay;
        fooddecaycounter = 0;
    }
}



int ViewCount = 0;

@end
