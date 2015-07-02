//
//  ProgressViews.h
//  Forsaken
//
//  Created by Alec Shedelbower on 6/18/14.
//  Copyright (c) 2014 Shedelbower Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

//Search Wreckage
float Prog1;            //Keeps track of where the bar was when you left the page.
float ProgSpeed1;       //How often the bar increase
float ProgIncrement1;   //How much the bar increases by
float TotalTime1;         //How long it will take for the entire bar to fill

//Revive Crew Members
float Prog2;
float ProgSpeed2;
float ProgIncrement2;

//Drink Water
float Prog3;
float ProgSpeed3;
float ProgIncrement3;

//Eat Food
float Prog4;
float ProgSpeed4;
float ProgIncrement4;

//Preserve Food
float Prog5;
float ProgSpeed5;
float ProgIncrement5;

//Plant Crops
float Prog6;
float ProgSpeed6;
float ProgIncrement6;

//Harvest Crops
float Prog7;
float ProgSpeed7;
float ProgIncrement7;

//Burn Wood
float Prog8;
float ProgSpeed8;
float ProgIncrement8;

//Collect Water
float Prog9;
float ProgSpeed9;
float ProgIncrement9;

//Electricity
float Electricity;

//Health Bar
float Health;
float HealthSpeed;
float HealthIncrement;

//Food
float Food;
float FoodSpeed;
float FoodIncrementDown;
float FoodIncrementUp;

//Water
float Water;
float WaterSpeed;
float WaterIncrementDown;
float WaterIncrementUp;




@interface ProgressViews : NSNumber




@end
