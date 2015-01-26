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

@end
