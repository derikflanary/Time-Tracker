//
//  Entries.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"
static NSString * const startTimeKey = @"startTimeKey";
static NSString * const endTimeKey = @"endTimeKey";
//static NSString * const timeKey = @"timeKey";

@implementation Entry

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        self.startTime = [dictionary objectForKey:startTimeKey];
        self.endTime = [dictionary objectForKey:endTimeKey];
        //self.entryTime = [dictionary objectForKey:timeKey];
    }
    return self;
}

-(NSDictionary *)makeEntryIntoDictionary{
    NSMutableDictionary *mutableEntryDict = [NSMutableDictionary dictionary];
    if (self.startTime){
        [mutableEntryDict setValue:self.startTime forKey:startTimeKey];
    }
    if (self.endTime){
        [mutableEntryDict setValue:self.endTime forKey:endTimeKey];
    }
//    if (self.entryTime){
//        [mutableEntryDict setValue:self.entryTime forKey:timeKey];
//    }
    return mutableEntryDict;
}

-(NSString *)setEntryTime {
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
        
        NSTimeInterval distanceBetweenDates = [self.endTime timeIntervalSinceDate:self.startTime];
        
        // First we'll see how many hours
        double secondsInAnHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
        
        // We need to subtract out the hours and then see how many minutes
        double secondsInAMinute = 60;
        NSInteger minutesBetweenDates = (distanceBetweenDates - (hoursBetweenDates * secondsInAnHour)) / secondsInAMinute;
        
        totalHours += hoursBetweenDates;
        totalMinutes += minutesBetweenDates;
        
    
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    
    NSString *minuteString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minuteString];
}


@end
