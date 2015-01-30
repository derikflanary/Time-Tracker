//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "Entry.h"

@interface ProjectController : NSObject

@property(readonly, strong, nonatomic)NSArray *projects;
//@property(readonly, strong, nonatomic)NSArray *entries;
@property (nonatomic, strong)Project *project;


+ (ProjectController *)sharedInstance;

-(void)addProjectWithTitle:(NSString *)title andText:(NSString *)text;
-(void)removeProject:(Project *)project;
- (void)replaceProject:(Project *)oldProject withEntry:(Project *)newProjects;
-(void)save;
-(NSArray *)projects;
-(void)startNewEntry;
-(void)endCurrentEntry;
-(void)addEntry:(Entry *)entry;
-(NSString *)setProjectTime;
-(NSString *)setEntryTime;

@end
