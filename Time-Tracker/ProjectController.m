//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

static NSString * const projectKey = @"projectKey";

@interface ProjectController()

@property(nonatomic,strong)NSArray *projects;

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
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectKey];
    NSMutableArray *arrayOfProjects = [NSMutableArray array];
    for (NSDictionary *projectDict in projectDictionaries) {
        Project *project = [[Project alloc]initWithDictionary:projectDict];
        [arrayOfProjects addObject:project];
    }
    for (Project *project in arrayOfProjects) {
        NSMutableArray *mutableEntries = [NSMutableArray array];
        for (NSDictionary *entryDict in project.entries) {
            Entry *entry = [[Entry alloc]initWithDictionary:entryDict];
            [mutableEntries addObject:entry];
        }
        project.entries = mutableEntries;
    }
    self.projects = arrayOfProjects;
    
}

-(void)saveProjectsToDefaults:(NSArray*)projectArray{
   
           NSMutableArray *mutableProjectDictionariesArray = [NSMutableArray array];
    
    for (Project *project in projectArray) {
         NSMutableArray *mutableEntries = [NSMutableArray array];
        
        for (Entry *entry in project.entries) {
            NSDictionary *entryDict = [NSDictionary dictionary];
            entryDict = [entry makeEntryIntoDictionary];
            [mutableEntries addObject:entryDict];
        }
        project.entries = mutableEntries;
        NSDictionary *projectDictionary = [project makeProjectIntoDictionary];
        [mutableProjectDictionariesArray addObject:projectDictionary];
    }
    [[NSUserDefaults standardUserDefaults]setObject:mutableProjectDictionariesArray forKey:projectKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)addProject:(Project *)project{
    NSMutableArray *mutableProjectArray = [[NSMutableArray alloc]initWithArray:self.projects];
    [mutableProjectArray addObject:project];
    self.projects = mutableProjectArray;
    [self saveProjectsToDefaults:self.projects];
}

-(void)removeProject:(Project *)project{
    
}

- (void)replaceProject:(Project *)oldProject withEntry:(Project *)newProjects{
    
}



@end

