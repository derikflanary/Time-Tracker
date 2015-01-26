//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

@interface ProjectController()

@property(nonatomic,strong)NSArray *projectsArray;

@end

@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProjectController alloc] init];
        
        [sharedInstance loadProjectsFromDefaults];
    });
    return sharedInstance;
}


-(void)loadProjectsFromDefaults{
    
}

-(void)saveProjectsToDefaults{
    
}

-(void)addProject:(Projects *)project{
    
}

-(void)removeProject:(Projects *)project{
    
}

- (void)replaceProject:(Projects *)oldProject withEntry:(Projects *)newProjects{
    
}



@end

