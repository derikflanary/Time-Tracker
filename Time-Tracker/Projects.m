//
//  Projects.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Projects.h"
static NSString * const projectTitleKey = @"titleKey";
static NSString * const projectTextKey = @"textKey";
static NSString * const projectTimeKey = @"dateKey";



@implementation Projects

-(id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        self.projectTitle = [dictionary objectForKey:projectTitleKey];
        self.projectText = [dictionary objectForKey:projectTextKey];
        self.projectTime = [dictionary objectForKey:projectTimeKey];
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
    return mutableProjectDict;
}

@end
