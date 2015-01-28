//
//  Projects.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"
#import "Entry.h"
#import "ProjectController.h"
static NSString * const projectTitleKey = @"titleKey";
static NSString * const projectTextKey = @"textKey";
static NSString * const projectTimeKey = @"dateKey";
static NSString * const projectEntryKey = @"projectEntryKey";

@interface Project()

@property (nonatomic, strong)Entry *currentEntry;


@end


@implementation Project

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        self.projectTitle = [dictionary objectForKey:projectTitleKey];
        self.projectText = [dictionary objectForKey:projectTextKey];
        self.projectTime = [dictionary objectForKey:projectTimeKey];
        self.entries = [dictionary objectForKey:projectEntryKey];
    }
    return self;
}

-(NSDictionary *)makeProjectIntoDictionary{
    NSMutableDictionary *mutableProjectDict = [NSMutableDictionary dictionary];
    if (self.projectTitle){
        [mutableProjectDict setValue:self.projectTitle forKey:projectTitleKey];
    }
    if (self.projectText){
        [mutableProjectDict setValue:self.projectText forKey:projectTextKey];
    }
    if (self.projectTime){
        [mutableProjectDict setValue:self.projectTime forKey:projectTimeKey];
    }
    if (self.entries){
        [mutableProjectDict setValue:self.entries forKey:projectEntryKey];
    }
    return mutableProjectDict;
}

-(void)startNewEntry{
    Entry *newEntry = [Entry new];
    newEntry.startTime = [NSDate date];
    self.currentEntry = newEntry;
    [self addEntry:newEntry];
    
}
-(void)endCurrentEntry{
    self.currentEntry.endTime = [NSDate date];
    //[self addEntry:self.currentEntry];
}

-(void)addEntry:(Entry *)entry{
    if (!entry){
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc]initWithArray:self.entries];
    [mutableEntries addObject:entry];
    self.entries = mutableEntries;
    
}

-(void)removeEntry:(Entry *)entry{
    if (!entry){
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc]initWithArray:self.entries];
    [mutableEntries removeObject:entry];
    self.entries = mutableEntries;
   

}

-(NSString *)setProjectTime {
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
    for (Entry *entry in self.entries) {
        
        NSTimeInterval distanceBetweenDates = [entry.endTime timeIntervalSinceDate:entry.startTime];
        
        // First we'll see how many hours
        double secondsInAnHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
        
        // We need to subtract out the hours and then see how many minutes
        double secondsInAMinute = 60;
        NSInteger minutesBetweenDates = (distanceBetweenDates - (hoursBetweenDates * secondsInAnHour)) / secondsInAMinute;
        
        totalHours += hoursBetweenDates;
        totalMinutes += minutesBetweenDates;
        if (totalMinutes > 59) {
            NSInteger hoursInMinutes = totalMinutes/60;
            totalMinutes = totalMinutes - (hoursBetweenDates * 60);
            totalHours = totalHours + hoursInMinutes;
        }
        
    }
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    
    NSString *minuteString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minuteString];
}

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry{
    
}


@end
