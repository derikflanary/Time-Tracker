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

@property(readonly, strong)NSArray *projects;


+ (ProjectController *)sharedInstance;

-(void)addProject:(Project *)project;
-(void)removeProject:(Project *)project;
- (void)replaceProject:(Project *)oldProject withEntry:(Project *)newProjects;


@end
