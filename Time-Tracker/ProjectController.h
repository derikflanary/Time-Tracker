//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Projects.h"
#import "Entries.h"

@interface ProjectController : NSObject

@property(readonly, strong)NSArray *projects;
@property(readonly,strong)NSArray *entries;

+ (ProjectController *)sharedInstance;

-(void)addProject:(Projects *)project;
-(void)removeProject:(Projects *)project;
- (void)replaceProject:(Projects *)oldProject withEntry:(Projects *)newProjects;
-(void)addEntry:(Entries *)entry;
-(void)removeEntry:(Entries *)entry;
- (void)replaceEntry:(Entries *)oldEntry withEntry:(Entries *)newEntry;

@end
