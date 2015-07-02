//
//  AllSupplies.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/18/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//Supply name that is displayed in SupplyViewController and amount shown.
int woodAmount;
int nailsAmount;
int charcoalAmount;
int gasolineAmount;
int foodAmount;
int waterAmount;
int clothAmount;
int wireAmount;
int metalscrapAmount;
int screwsAmount;
int metalAmount;
int medicineAmount;
int rubberAmount;
int stringAmount;
int saltAmount;
int electricityAmount;
int glassAmount;
int batteriesAmount;
int preservedfoodAmount;
int seedsAmount;

int maximumelectricityAmount;

//Food Decay
int fooddecayspeed;//how often the food decay function is called
int fooddecayspeed2; //equals the number of times the food decay function is called before actual removing food.
float fooddecaypercentage;
int roundedfooddecay;
float fridgedecaypercentage;
int fooddecaycounter;//keeps track how many times the food decay funciton has been called.

//Crops
int plantedcropsAmount;
int ripecropsAmount;
int maximumcropsAmount;
int currentcropsAmount;

int cropgrowthrate; //Time in seconds that it takes a crop to ripe after planted.

bool cropspot1;
bool cropspot2;
bool cropspot3;
bool cropspot4;
bool cropspot5;
bool cropspot6;
bool cropspot7;
bool cropspot8;
bool cropspot9;
bool cropspot10;
bool cropspot11;
bool cropspot12;
bool cropspot13;
bool cropspot14;
bool cropspot15;
bool cropspot16;
bool cropspot17;
bool cropspot18;
bool cropspot19;
bool cropspot20;

int cropcounter1;
int cropcounter2;
int cropcounter3;
int cropcounter4;
int cropcounter5;
int cropcounter6;
int cropcounter7;
int cropcounter8;
int cropcounter9;
int cropcounter10;
int cropcounter11;
int cropcounter12;
int cropcounter13;
int cropcounter14;
int cropcounter15;
int cropcounter16;
int cropcounter17;
int cropcounter18;
int cropcounter19;
int cropcounter20;

//Other
int securityAmount;

//Tools
int shovelAmount;
int sawAmount;
int hammerAmount;
int blowtorchAmount;
int chainsawAmount;
int solderingironAmount;
int axeAmount;
int sickleAmount;

int shovelbuttoncolor;
int sawbuttoncolor;
int hammerbuttoncolor;
int blowtorchbuttoncolor;
int chainsawbuttoncolor;
int solderingironbuttoncolor;
int axebuttoncolor;
int sicklebuttoncolor;

//Vehicles
int bicycleAmount;
int motorcycleAmount;
int jeepAmount;
int electriccarAmount;
int hybridAmount;
int truckAmount;

BOOL motorcycleSelected;
BOOL jeepSelected;
BOOL electriccarSelected;
BOOL hybridSelected;
BOOL truckSelected;

int bicyclebuttoncolor;
int motorcyclebuttoncolor;
int jeepbuttoncolor;
int electriccarbuttoncolor;
int hybridbuttoncolor;
int truckbuttoncolor;

//Weapons
int clubAmount;
int spikedclubAmount;
int longbowAmount;
int maceAmount;
int macheteAmount;
int pistolAmount;
int shotgunAmount;
int sniperAmount;

//Builds
int fenceAmount;
int boardwindowsAmount;
int raincollectorAmount;
int firepitAmount;
int shackAmount;
int fridgeAmount;
int sewingmachineAmount;
int radioAmount;
int gasgeneratorAmount;
int forgeAmount;

int fencebuttoncolor;
int boardwindowsbuttoncolor;
int raincollectorbuttoncolor;
int firepitbuttoncolor;
int shackbuttoncolor;
int fridgebuttoncolor;
int sewingmachinebuttoncolor;
int radiobuttoncolor;
int gasgeneratorbuttoncolor;
int forgebuttoncolor;

int maximumraincollectorAmount;
int maximumshackAmount;
int maximumboardwindowsAmount;
int maximumfenceAmount;

int fencewoodCost;
int fencenailsCost;

int boardwindowswoodCost;
int boardwindowsnailsCost;

int raincollectorwoodCost;
int raincollectornailsCost;
int raincollectorglassCost;

int firepitwoodCost;

int shackwoodCost;
int shacknailsCost;
int shackglassCost;
int shackclothCost;

int fridgemetalCost;
int fridgewireCost;
int fridgescrewsCost;

int sewingmachinemetalCost;
int sewingmachinewireCost;
int sewingmachinescrewsCost;

int radiometalCost;
int radiowireCost;
int radioscrewsCost;

int gasgeneratormetalCost;
int gasgeneratorwireCost;
int gasgeneratorscrewsCost;
int gasgeneratorbatteriesCost;

int forgemetalCost;
int forgescrewsCost;

int bicyclemetalCost;
int bicyclescrewsCost;
int bicycleclothCost;
int bicyclerubberCost;

int motorcyclemetalCost;
int motorcyclescrewsCost;
int motorcycleclothCost;
int motorcyclebatteriesCost;
int motorcyclewireCost;
int motorcycleglassCost;
int motorcyclerubberCost;

int jeepmetalCost;
int jeepscrewsCost;
int jeepclothCost;
int jeeprubberCost;
int jeepbatteriesCost;
int jeepwireCost;
int jeepglassCost;

int electriccarmetalCost;
int electriccarscrewsCost;
int electriccarclothCost;
int electriccarrubberCost;
int electriccarbatteriesCost;
int electriccarwireCost;
int electriccarglassCost;

int hybridmetalCost;
int hybridscrewsCost;
int hybridclothCost;
int hybridrubberCost;
int hybridbatteriesCost;
int hybridwireCost;
int hybridglassCost;

int truckmetalCost;
int truckscrewsCost;
int truckclothCost;
int truckrubberCost;
int truckbatteriesCost;
int truckwireCost;
int truckglassCost;



int ViewCount;


@interface AllSupplies : NSObject




+(void)FoodDecay;

+(void)CropCounter;
+(void)CropPlacer;




@end
