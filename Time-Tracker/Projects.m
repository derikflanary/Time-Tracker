//
//  Projects.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Projects.h"
#import "Entries.h"
#import "ProjectController.h"
static NSString * const projectTitleKey = @"titleKey";
static NSString * const projectTextKey = @"textKey";
static NSString * const projectTimeKey = @"dateKey";
static NSString * const projectEntriesKey = @"projectEntriesKey";

@interface Projects()

@property (nonatomic, strong)Entries *currentEntry;


@end


@implementation Projects

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        self.projectTitle = [dictionary objectForKey:projectTitleKey];
        self.projectText = [dictionary objectForKey:projectTextKey];
        self.projectTime = [dictionary objectForKey:projectTimeKey];
        self.entries = [dictionary objectForKey:projectEntriesKey];
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
        [mutableProjectDict setValue:self forKey:projectEntriesKey];
    }
    return mutableProjectDict;
}

-(void)startNewEntry{
    Entries *newEntry = [Entries new];
    newEntry.startTime = [NSDate date];
    self.currentEntry = newEntry;
    [self addEntry:newEntry];
    
}
-(void)endCurrentEntry{
    self.currentEntry.endTime = [NSDate date];
    [self addEntry:self.currentEntry];
}

-(void)addEntry:(Entries *)entry{
    if (!entry){
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc]initWithArray:self.entries];
    [mutableEntries addObject:entry];
    self.entries = mutableEntries;
    NSLog(@"%@", mutableEntries);
    
}

-(void)removeEntry:(Entries *)entry{
    
}

- (void)replaceEntry:(Entries *)oldEntry withEntry:(Entries *)newEntry{
    
}


@end
