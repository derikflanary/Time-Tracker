//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"
#import "Stack.h"

static NSString * const projectKey = @"projectKey";

@interface ProjectController()

@property(nonatomic, strong)NSArray *projects;
@property (nonatomic, strong)Entry *currentEntry;
//@property(nonatomic, strong)NSArray *entries;


@end

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectController alloc] init];
        
    });
    return sharedInstance;
}

-(void)addProjectWithTitle:(NSString *)title andText:(NSString *)text{
    Project *newProject = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    newProject.projectTitle = title;
    newProject.projectText = text;
   
    
    [self save];
}

-(void)save{
    [[Stack sharedInstance].managedObjectContext save:NULL];
}



-(void)removeProject:(Project *)project{
    [[Stack sharedInstance].managedObjectContext deleteObject:project];
    [self save];
}

-(NSArray *)projects{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Project"];
    NSArray *allProjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    return allProjects;
}


- (void)replaceProject:(Project *)oldProject withEntry:(Project *)newProject{
    
}


////////////ADDED FROM PROJECT.M/////////////////

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
    [self.project addEntriesObject:entry];
    
}

-(void)removeEntry:(Entry *)entry{
    if (!entry){
        return;
    }
    [self.project removeEntriesObject:entry];
    
}

-(NSString *)setProjectTime{
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
    for (Entry *entry in self.project.entries) {
        
        NSTimeInterval distanceBetweenDates = [entry.endTime timeIntervalSinceDate:entry.startTime];
        if (distanceBetweenDates > 0) {
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
                totalMinutes = totalMinutes - (hoursInMinutes * 60);
                totalHours = totalHours + hoursInMinutes;
            }
            
        }
        
    }
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    
    NSString *minuteString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minuteString];
}

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry{
    
}

-(NSString *)setEntryTime {
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
    
    NSTimeInterval distanceBetweenDates = [self.currentEntry.endTime timeIntervalSinceDate:self.currentEntry.startTime];
    
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

