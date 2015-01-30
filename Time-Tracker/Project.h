//
//  Project.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Project : NSManagedObject

@property (nonatomic, retain) NSString * projectTitle;
@property (nonatomic, retain) NSString * projectText;
@property (nonatomic, retain) NSDate * projectTime;
@property (nonatomic, retain) NSSet *entries;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addEntriesObject:(NSManagedObject *)value;
- (void)removeEntriesObject:(NSManagedObject *)value;
- (void)addEntries:(NSSet *)values;
- (void)removeEntries:(NSSet *)values;

@end
