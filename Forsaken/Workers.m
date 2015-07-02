//
//  Workers.m
//  Forsaken
//
//  Created by Alec Shedelbower on 6/24/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import "Workers.h"
#import "AllSupplies.h"
#import "ProgressViews.h"

int maximumworkersAmount = 10;
int totalworkersAmount = 10;
int freeworkersAmount = 10;

int workerspeedLR = 10;
int workerspeedSR = 30;

int WorkersTimerLRCount = 0;
int WorkersTimerSRCount = 0;

//Living Room Workers
int preservefoodworkersAmount = 0;
int burnwoodworkersAmount = 0;
int collectwaterworkersAmount = 0;
int plantcropsworkersAmount = 0;
int harvestcropsworkersAmount = 0;
int choptreesworkersAmount = 0;
int purifymetalworkersAmount = 0;
int guardshelterworkersAmount = 0;
int healmeworkersAmount = 0;
int sewclothworkersAmount = 0;
int makebatteriesworkersAmount = 0;
int fuelgeneratorworkersAmount = 0;

//Supply Run Workers
int loothousesworkersAmount = 0;
int lootcarsworkersAmount = 0;
int junkyardworkersAmount = 0;
int grocerystoreworkersAmount = 0;
int hardwarestoreworkersAmount = 0;
int pharmacyworkersAmount = 0;
int ammostoreworkersAmount = 0;
int clothingstoreworkersAmount = 0;
int gasstationworkersAmount = 0;

int grocerystorefoodCost = 0;
int grocerystoregasolineCost = 0;
int grocerystoreelectricityCost = 0;
int grocerystorefoodAmount = 0;
int grocerystoresaltAmount = 0;
int grocerystorewaterAmount = 0;

int clothingstorefoodCost = 0;
int clothingstoregasolineCost = 0;
int clothingstoreelectricityCost = 0;
int clothingstoreclothAmount = 0;
int clothingstorestringAmount = 0;

int pharmacyfoodCost = 0;
int pharmacygasolineCost = 0;
int pharmacyelectricityCost = 0;
int pharmacymedicineAmount = 0;

int hardwarestorefoodCost = 0;
int hardwarestoregasolineCost = 0;
int hardwarestoreelectricityCost = 0;
int hardwarestoremetalAmount = 0;
int hardwarestorescrewsAmount = 0;
int hardwarestorewiresAmount = 0;
int hardwarestorewoodAmount = 0;

int gasstationfoodCost = 0;
int gasstationgasolineCost = 0;
int gasstationelectricityCost = 0;
int gasstationgasolineAmount = 0;

@implementation Workers

//Living Room
+ (void)UpdateLRWorkersOutput{
    WorkersTimerLRCount += 1;
    if (WorkersTimerLRCount == workerspeedLR) {
        [self AddLRWorkersOutput];
        WorkersTimerLRCount = 0;
    }
}

+ (void)AddLRWorkersOutput{
    //Preserve Food
    
    if (foodAmount > 0 && saltAmount > 0 && preservefoodworkersAmount > 0) {
        for (i = preservefoodworkersAmount; i > 0; i -= 1) {
            if (foodAmount > 0 && saltAmount > 0) {
                preservedfoodAmount += 1;
                foodAmount -= 1;
                saltAmount -= 1;
            }
        }
    }
    //Burn Wood
    if (woodAmount > 0 && firepitAmount > 0 && burnwoodworkersAmount > 0) {
        for (i = burnwoodworkersAmount; i > 0; i -= 1) {
            if (woodAmount >= 1) {
                charcoalAmount += 1;
                woodAmount -= 1;
            }
        }
    }
    //Collect Water
    if (raincollectorAmount > 0 && collectwaterworkersAmount > 0) {
        waterAmount += collectwaterworkersAmount*raincollectorAmount;
    }
    //Harvest Crops (Only 1 Worker)
    if (ripecropsAmount > 0 && harvestcropsworkersAmount > 0) {
        foodAmount += ripecropsAmount + ripecropsAmount*sickleAmount;
        seedsAmount += ripecropsAmount*2;
        ripecropsAmount = 0;
    }
    //Plant Crops (needs improvement)
    currentcropsAmount = plantedcropsAmount + ripecropsAmount;
    if (seedsAmount > 0 && waterAmount > 0 && currentcropsAmount < maximumcropsAmount && plantcropsworkersAmount > 0) {
        for (i = plantcropsworkersAmount; i > 0; i -= 1) {
            if (seedsAmount >= 1 && waterAmount >= 1 && currentcropsAmount < maximumcropsAmount) {
                seedsAmount -= 1;
                waterAmount -= 1;
                [AllSupplies CropPlacer];
                currentcropsAmount = plantedcropsAmount + ripecropsAmount;
            }
        }
    }
    //Chop Trees
    if (axeAmount > 0 && chainsawAmount == 0) {
        woodAmount += choptreesworkersAmount *2;
    }
    else if (chainsawAmount > 0){
        woodAmount += choptreesworkersAmount *4;
    }
    //Purify Metal
    if (forgeAmount > 0 && charcoalAmount >= 2 && metalscrapAmount >= 1) {
        for (i = purifymetalworkersAmount; i > 0; i -= 1) {
            if (charcoalAmount >= 2 && metalscrapAmount >= 1) {
                charcoalAmount -= 2;
                metalscrapAmount -= 1;
                metalAmount += 1;
            }
        }
    }
    //Guard Shelter (Caculated differently)
    
    //Heal Me
    if (medicineAmount > 0 && healmeworkersAmount > 0 && Health <= 0.75) {
        Health += 0.25;
        medicineAmount -= 1;
    }
    
    //Sew Cloth
    if (sewingmachineAmount > 0 && sewclothworkersAmount > 0 && stringAmount >= 4 && electricityAmount > 0) {
        for (i = sewclothworkersAmount; i > 0; i -= 1) {
            if (stringAmount >= 4 && electricityAmount > 0) {
                stringAmount -= 4;
                electricityAmount -= 1;
                clothAmount += 1;
            }
        }
    }
    
    //Make Batteries
    if (metalAmount > 0 && wireAmount > 0 && makebatteriesworkersAmount > 0) {
        for (i = makebatteriesworkersAmount; i > 0; i -= 1) {
            if (metalAmount >= 1 && wireAmount >= 1) {
                metalAmount -= 1;
                wireAmount -= 1;
                batteriesAmount += 2;
            }
        }
    }
    
    //Fuel Generator
    if (gasolineAmount > 0 && gasgeneratorAmount > 0 && fuelgeneratorworkersAmount > 0) {
        for (i = fuelgeneratorworkersAmount; i > 0; i -= 1) {
            if (gasolineAmount >= 1) {
                gasolineAmount -= 1;
                electricityAmount += 10;
            }
        }
    }
}

+ (void)AddWorker1{
    if (freeworkersAmount > 0) {
        preservefoodworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker2{
    if (freeworkersAmount > 0) {
    burnwoodworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker3{
    if (freeworkersAmount > 0) {
    collectwaterworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker4{
    if (freeworkersAmount > 0) {
    plantcropsworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker5{
    if (freeworkersAmount > 0) {
    harvestcropsworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker6{
    if (freeworkersAmount > 0) {
    choptreesworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker7{
    if (freeworkersAmount > 0) {
    purifymetalworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker8{
    if (freeworkersAmount > 0) {
    guardshelterworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker9{
    if (freeworkersAmount > 0) {
    healmeworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker10{
    if (freeworkersAmount > 0) {
    sewclothworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker11{
    if (freeworkersAmount > 0) {
    makebatteriesworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}
+ (void)AddWorker12{
    if (freeworkersAmount > 0) {
    fuelgeneratorworkersAmount += 1;
    freeworkersAmount -= 1;
    }
}



+ (void)SubtractWorker1{
    if (preservefoodworkersAmount > 0) {
    preservefoodworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker2{
    if (burnwoodworkersAmount > 0) {
    burnwoodworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker3{
    if (collectwaterworkersAmount > 0) {
    collectwaterworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker4{
    if (plantcropsworkersAmount > 0) {
    plantcropsworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker5{
    if (harvestcropsworkersAmount > 0) {
    harvestcropsworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker6{
    if (choptreesworkersAmount > 0) {
    choptreesworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker7{
    if (purifymetalworkersAmount > 0) {
    purifymetalworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker8{
    if (guardshelterworkersAmount > 0) {
    guardshelterworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker9{
    if (healmeworkersAmount > 0) {
    healmeworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker10{
    if (sewclothworkersAmount > 0) {
    sewclothworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker11{
    if (makebatteriesworkersAmount > 0) {
    makebatteriesworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker12{
    if (fuelgeneratorworkersAmount > 0) {
    fuelgeneratorworkersAmount -= 1;
    freeworkersAmount += 1;
    }
}



//Supply Run

+ (void)UpdateSRWorkersOutput{
    WorkersTimerSRCount += 1;
    if (WorkersTimerSRCount == workerspeedSR) {
        [self AddSRWorkersOutput];
        WorkersTimerSRCount = 0;
    }
}

+ (void)AddSRWorkersOutput{
    //Loot Houses
    if (loothousesworkersAmount > 0 && (foodAmount > 0 || preservedfoodAmount > 0)) {
        for (n = loothousesworkersAmount; n > 0; n -= 1) {
            if (foodAmount > 0 || preservedfoodAmount > 0) {
                if (foodAmount > 0) {
                    foodAmount -= 1;
                }
                else {
                    preservedfoodAmount -= 1;
                }
                clothAmount += 1;
                saltAmount += 1;
                nailsAmount += 1;
                stringAmount += 2;
            }
        }
    }
    //Loot Cars
    if (lootcarsworkersAmount > 0 && (foodAmount >= 2 || preservedfoodAmount >=2) && bicycleAmount > 0) {
        for (n = lootcarsworkersAmount; n > 0; n -= 1) {
            if (foodAmount >= 2 || preservedfoodAmount >= 2) {
                if (foodAmount >=2) {
                    foodAmount -= 2;
                }
                else {
                    preservedfoodAmount -= 2;
                }
                gasolineAmount += 1;
                rubberAmount += 1;
                wireAmount += 1;
                glassAmount += 2;
            }
        }
    }
    //Junkyard
    if (junkyardworkersAmount > 0 && (foodAmount >= 3 || preservedfoodAmount >= 3) && bicycleAmount > 0) {
        for (n = junkyardworkersAmount; n > 0; n -= 1) {
            if (foodAmount >= 3 || preservedfoodAmount >= 3) {
                if (foodAmount >=3) {
                    foodAmount -= 3;
                }
                else {
                    preservedfoodAmount -= 3;
                }
                metalscrapAmount += 2;
                wireAmount += 1;
                screwsAmount += 1;
            }
        }
    }
    //Grocery
    if (grocerystoreworkersAmount > 0) {
        for (n = grocerystoreworkersAmount; n > 0; n -= 1) {
            [Workers SelectedVehicleFuelAdequate:1];
        }
    }
    //Clothing Store
    if (clothingstoreworkersAmount > 0) {
        for (n = clothingstoreworkersAmount; n > 0; n -= 1) {
            [Workers SelectedVehicleFuelAdequate:2];
        }
    }
    //Pharmacy
    if (pharmacyworkersAmount > 0) {
        for (n = pharmacyworkersAmount; n > 0; n -= 1) {
            [Workers SelectedVehicleFuelAdequate:3];
        }
    }
    //Hardware Store
    if (hardwarestoreworkersAmount > 0) {
        for (n = hardwarestoreworkersAmount; n > 0; n -= 1) {
            [Workers SelectedVehicleFuelAdequate:4];
        }
    }
    //Gas Station
    if (gasstationworkersAmount > 0) {
        for (n = gasstationworkersAmount; n > 0; n -= 1) {
            [Workers SelectedVehicleFuelAdequate:5];
        }
    }

}

+ (void)SelectedVehicleFuelAdequate:(int)Destination{
    //Places unlocked when new people entr team.
    //D1 = Grocery Store
    //D2 = Clothing Store
    //D3 = Pharmacy
    //D4 = Hardware Store
    //D5 = Gas Station
    if (Destination == 1) {
        if (motorcycleSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 1) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 1;
            //Put loot here
            foodAmount += 10;
            saltAmount += 10;
            waterAmount += 5;
        }

        else if (jeepSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 2) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 1;
            //Put loot here
            foodAmount += 20;
            saltAmount += 20;
            waterAmount += 10;
        }
        else if (electriccarSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && electricityAmount >= 10) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            electricityAmount -= 10;
            //Put loot here
            foodAmount += 15;
            saltAmount += 15;
            waterAmount += 8;
        }
        else if (hybridSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && (gasolineAmount >= 2 || electricityAmount >= 10)) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            //Hybrid Fuel Calculation:
            if (electricityAmount >= 10) {
                electricityAmount -= 10;
            }
            else if (gasolineAmount >= 2) {
                gasolineAmount -= 2;
            }
            //Put loot here
            foodAmount += 20;
            saltAmount += 20;
            waterAmount += 10;
        }
        else if (truckSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 4) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 4;
            //Put loot here
            foodAmount += 40;
            saltAmount += 40;
            waterAmount += 20;
        }

    }
    if (Destination == 2) {
        if (motorcycleSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 1) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 1;
            //Put loot here
            clothAmount += 5;
            stringAmount += 10;
        }
        
        else if (jeepSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 2) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 1;
            //Put loot here
            clothAmount += 10;
            stringAmount += 20;
        }
        else if (electriccarSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && electricityAmount >= 10) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            electricityAmount -= 10;
            //Put loot here
            clothAmount += 7;
            stringAmount += 15;
        }
        else if (hybridSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && (gasolineAmount >= 2 || electricityAmount >= 10)) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            //Hybrid Fuel Calculation:
            if (electricityAmount >= 10) {
                electricityAmount -= 10;
            }
            else if (gasolineAmount >= 2) {
                gasolineAmount -= 2;
            }
            //Put loot here
            clothAmount += 10;
            stringAmount += 20;
        }
        else if (truckSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 4) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 4;
            //Put loot here
            
        }        else if (truckSelected == YES && (preservedfoodAmount >= 1 || foodAmount >= 1) && gasolineAmount >= 4) {
            if (foodAmount >= 1) {
                foodAmount -= 1;
            }
            else if (preservedfoodAmount >= 1){
                preservedfoodAmount -= 1;
            }
            gasolineAmount -= 4;
            //Put loot here
            clothAmount += 20;
            stringAmount += 40;
        }
    }
    if (Destination == 3) {
        if (motorcycleSelected == YES && (preservedfoodAmount >= 2 || foodAmount >= 2) && gasolineAmount >= 2) {
            if (foodAmount >= 2) {
                foodAmount -= 2;
            }
            else if (preservedfoodAmount >= 2){
                preservedfoodAmount -= 2;
            }
            gasolineAmount -= 2;
            //Put loot here
            medicineAmount += 10;
        }
        
        else if (jeepSelected == YES && (preservedfoodAmount >= 2 || foodAmount >= 2) && gasolineAmount >= 4) {
            if (foodAmount >= 2) {
                foodAmount -= 2;
            }
            else if (preservedfoodAmount >= 2){
                preservedfoodAmount -= 2;
            }
            gasolineAmount -= 4;
            //Put loot here
            medicineAmount += 20;
        }
        else if (electriccarSelected == YES && (preservedfoodAmount >= 2 || foodAmount >= 2) && electricityAmount >= 20) {
            if (foodAmount >= 2) {
                foodAmount -= 2;
            }
            else if (preservedfoodAmount >= 2){
                preservedfoodAmount -= 2;
            }
            electricityAmount -= 20;
            //Put loot here
            medicineAmount += 15;
        }
        else if (hybridSelected == YES && (preservedfoodAmount >= 2 || foodAmount >= 2) && (gasolineAmount >= 4 || electricityAmount >= 20)) {
            if (foodAmount >= 2) {
                foodAmount -= 2;
            }
            else if (preservedfoodAmount >= 2){
                preservedfoodAmount -= 2;
            }
            //Hybrid Fuel Calculation:
            if (electricityAmount >= 20) {
                electricityAmount -= 20;
            }
            else if (gasolineAmount >= 4) {
                gasolineAmount -= 4;
            }
            //Put loot here
            medicineAmount += 20;
        }
        else if (truckSelected == YES && (preservedfoodAmount >= 2 || foodAmount >= 2) && gasolineAmount >= 8) {
            if (foodAmount >= 2) {
                foodAmount -= 2;
            }
            else if (preservedfoodAmount >= 2){
                preservedfoodAmount -= 2;
            }
            gasolineAmount -= 8;
            //Put loot here
            medicineAmount += 40;
        }
    }
    if (Destination == 4) {
        if (motorcycleSelected == YES && (preservedfoodAmount >= 3 || foodAmount >= 3) && gasolineAmount >= 3) {
            if (foodAmount >= 3) {
                foodAmount -= 3;
            }
            else if (preservedfoodAmount >= 3){
                preservedfoodAmount -= 3;
            }
            gasolineAmount -= 3;
            //Put loot here
            screwsAmount += 12;
            woodAmount += 10;
            metalAmount += 1;
            wireAmount += 4;
        }
        
        else if (jeepSelected == YES && (preservedfoodAmount >= 3 || foodAmount >= 3) && gasolineAmount >= 6) {
            if (foodAmount >= 3) {
                foodAmount -= 3;
            }
            else if (preservedfoodAmount >= 3){
                preservedfoodAmount -= 3;
            }
            gasolineAmount -= 6;
            //Put loot here
            screwsAmount += 24;
            woodAmount += 20;
            metalAmount += 2;
            wireAmount += 8;
        }
        else if (electriccarSelected == YES && (preservedfoodAmount >= 3 || foodAmount >= 3) && electricityAmount >= 30) {
            if (foodAmount >= 3) {
                foodAmount -= 3;
            }
            else if (preservedfoodAmount >= 3){
                preservedfoodAmount -= 3;
            }
            electricityAmount -= 30;
            //Put loot here
            screwsAmount += 18;
            woodAmount += 15;
            metalAmount += 1;
            wireAmount += 6;
        }
        else if (hybridSelected == YES && (preservedfoodAmount >= 3 || foodAmount >= 3) && (gasolineAmount >= 6 || electricityAmount >= 30)) {
            if (foodAmount >= 3) {
                foodAmount -= 3;
            }
            else if (preservedfoodAmount >= 3){
                preservedfoodAmount -= 3;
            }
            //Hybrid Fuel Calculation:
            if (electricityAmount >= 30) {
                electricityAmount -= 30;
            }
            else if (gasolineAmount >= 6) {
                gasolineAmount -= 6;
            }
            //Put loot here
            screwsAmount += 24;
            woodAmount += 20;
            metalAmount += 2;
            wireAmount += 8;
        }
        else if (truckSelected == YES && (preservedfoodAmount >= 3 || foodAmount >= 3) && gasolineAmount >= 12) {
            if (foodAmount >= 3) {
                foodAmount -= 3;
            }
            else if (preservedfoodAmount >= 3){
                preservedfoodAmount -= 3;
            }
            gasolineAmount -= 12;
            //Put loot here
            screwsAmount += 48;
            woodAmount += 40;
            metalAmount += 4;
            wireAmount += 16;
        }
    
    }
    if (Destination == 5) {
        if (motorcycleSelected == YES && (preservedfoodAmount >= 4 || foodAmount >= 4) && gasolineAmount >= 4) {
            if (foodAmount >= 4) {
                foodAmount -= 4;
            }
            else if (preservedfoodAmount >= 4){
                preservedfoodAmount -= 4;
            }
            gasolineAmount -= 4;
            //Put loot here
            gasolineAmount += 10;
        }
        
        else if (jeepSelected == YES && (preservedfoodAmount >= 4 || foodAmount >= 4) && gasolineAmount >= 8) {
            if (foodAmount >= 4) {
                foodAmount -= 4;
            }
            else if (preservedfoodAmount >= 4){
                preservedfoodAmount -= 4;
            }
            gasolineAmount -= 8;
            //Put loot here
            gasolineAmount += 20;
        }
        else if (electriccarSelected == YES && (preservedfoodAmount >= 4 || foodAmount >= 4) && electricityAmount >= 40) {
            if (foodAmount >= 4) {
                foodAmount -= 4;
            }
            else if (preservedfoodAmount >= 4){
                preservedfoodAmount -= 4;
            }
            electricityAmount -= 40;
            //Put loot here
            gasolineAmount += 15;
        }
        else if (hybridSelected == YES && (preservedfoodAmount >= 4 || foodAmount >= 4) && (gasolineAmount >= 8 || electricityAmount >= 40)) {
            if (foodAmount >= 4) {
                foodAmount -= 4;
            }
            else if (preservedfoodAmount >= 4){
                preservedfoodAmount -= 4;
            }
            //Hybrid Fuel Calculation:
            if (electricityAmount >= 40) {
                electricityAmount -= 40;
            }
            else if (gasolineAmount >= 8) {
                gasolineAmount -= 8;
            }
            //Put loot here
            gasolineAmount += 20;
        }
        else if (truckSelected == YES && (preservedfoodAmount >= 4 || foodAmount >= 4) && gasolineAmount >= 16) {
            if (foodAmount >= 4) {
                foodAmount -= 4;
            }
            else if (preservedfoodAmount >= 4){
                preservedfoodAmount -= 4;
            }
            gasolineAmount -= 16;
            //Put loot here
            gasolineAmount += 40;
        }
        
    }
}




+ (void)AddWorker13{
    if (freeworkersAmount > 0) {
        loothousesworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker14{
    if (freeworkersAmount > 0) {
        lootcarsworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker15{
    if (freeworkersAmount > 0) {
        junkyardworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker16{
    if (freeworkersAmount > 0) {
        grocerystoreworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker17{
    if (freeworkersAmount > 0) {
        hardwarestoreworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker18{
    if (freeworkersAmount > 0) {
        pharmacyworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker19{
    if (freeworkersAmount > 0) {
        clothingstoreworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}
+ (void)AddWorker20{
    if (freeworkersAmount > 0) {
        gasstationworkersAmount += 1;
        freeworkersAmount -= 1;
    }
}


+ (void)SubtractWorker13{
    if (loothousesworkersAmount > 0) {
        loothousesworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker14{
    if (lootcarsworkersAmount > 0) {
        lootcarsworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker15{
    if (junkyardworkersAmount > 0) {
        junkyardworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker16{
    if (grocerystoreworkersAmount > 0) {
        grocerystoreworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker17{
    if (hardwarestoreworkersAmount > 0) {
        hardwarestoreworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker18{
    if (pharmacyworkersAmount > 0) {
        pharmacyworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker19{
    if (clothingstoreworkersAmount > 0) {
        clothingstoreworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
+ (void)SubtractWorker20{
    if (gasstationworkersAmount > 0) {
        gasstationworkersAmount -= 1;
        freeworkersAmount += 1;
    }
}
    
    
    
    
@end
