//
//  Project.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entry;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSString * projectTitle;
@property (nonatomic, retain) NSString * projectText;
@property (nonatomic, retain) NSDate * projectTime;
@property (nonatomic, retain) NSNumber * position;
@property (nonatomic, retain) NSSet *entries;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addEntriesObject:(Entry *)value;
- (void)removeEntriesObject:(Entry *)value;
- (void)addEntries:(NSSet *)values;
- (void)removeEntries:(NSSet *)values;

@end
