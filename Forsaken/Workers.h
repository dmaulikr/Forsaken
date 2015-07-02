//
//  Workers.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/24/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int i; //Counter for "for" loop. (LR)
int n; //Counter for "for" loop. (SR)

int maximumworkersAmount;
int totalworkersAmount;
int freeworkersAmount;

int workerspeedLR;
int workerspeedSR;

int WorkersTimerLRCount;
int WorkersTimerSRCount;

//Living Room Workers
int preservefoodworkersAmount;
int burnwoodworkersAmount;
int collectwaterworkersAmount;
int plantcropsworkersAmount;
int harvestcropsworkersAmount;
int choptreesworkersAmount;
int purifymetalworkersAmount;
int guardshelterworkersAmount;
int healmeworkersAmount;
int sewclothworkersAmount;
int makebatteriesworkersAmount;
int fuelgeneratorworkersAmount;

//Supply Run
int loothousesworkersAmount;
int lootcarsworkersAmount;
int junkyardworkersAmount;
int grocerystoreworkersAmount;
int hardwarestoreworkersAmount;
int pharmacyworkersAmount;
int clothingstoreworkersAmount;
int gasstationworkersAmount;

int grocerystorefoodCost;
int grocerystoregasolineCost;
int grocerystoreelectricityCost;
int grocerystorefoodAmount;
int grocerystoresaltAmount;
int grocerystorewaterAmount;

int clothingstorefoodCost;
int clothingstoregasolineCost;
int clothingstoreelectricityCost;
int clothingstoreclothAmount;
int clothingstorestringAmount;

int pharmacyfoodCost;
int pharmacygasolineCost;
int pharmacyelectricityCost;
int pharmacymedicineAmount;

int hardwarestorefoodCost;
int hardwarestoregasolineCost;
int hardwarestoreelectricityCost;
int hardwarestoremetalAmount;
int hardwarestorescrewsAmount;
int hardwarestorewiresAmount;
int hardwarestorewoodAmount;

int gasstationfoodCost;
int gasstationgasolineCost;
int gasstationelectricityCost;
int gasstationgasolineAmount;




@interface Workers : NSObject

+ (void)AddLRWorkersOutput;//Acutally adds/subtracts what the workers have done.
+ (void)UpdateLRWorkersOutput;//Tracks the timer so it doesn't reset when you go to a new page

+ (void)UpdateSRWorkersOutput;
+ (void)AddSRWorkersOutput;

+ (void)SelectedVehicleFuelAdequate:(int)Destination;

//Living Room
+ (void)AddWorker1;
+ (void)AddWorker2;
+ (void)AddWorker3;
+ (void)AddWorker4;
+ (void)AddWorker5;
+ (void)AddWorker6;
+ (void)AddWorker7;
+ (void)AddWorker8;
+ (void)AddWorker9;
+ (void)AddWorker10;
+ (void)AddWorker11;
+ (void)AddWorker12;

+ (void)SubtractWorker1;
+ (void)SubtractWorker2;
+ (void)SubtractWorker3;
+ (void)SubtractWorker4;
+ (void)SubtractWorker5;
+ (void)SubtractWorker6;
+ (void)SubtractWorker7;
+ (void)SubtractWorker8;
+ (void)SubtractWorker9;
+ (void)SubtractWorker10;
+ (void)SubtractWorker11;
+ (void)SubtractWorker12;

//Supply Run
+ (void)AddWorker13;
+ (void)AddWorker14;
+ (void)AddWorker15;
+ (void)AddWorker16;
+ (void)AddWorker17;
+ (void)AddWorker18;
+ (void)AddWorker19;
+ (void)AddWorker20;

+ (void)SubtractWorker13;
+ (void)SubtractWorker14;
+ (void)SubtractWorker15;
+ (void)SubtractWorker16;
+ (void)SubtractWorker17;
+ (void)SubtractWorker18;
+ (void)SubtractWorker19;
+ (void)SubtractWorker20;










@end
