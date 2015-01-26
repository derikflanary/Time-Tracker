//
//  Projects.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Entries.h"

@interface Projects : NSObject

@property (nonatomic, strong)NSString *projectTitle;
@property (nonatomic, strong)NSString *projectText;
@property (nonatomic, strong)NSDate *projectTime;
@property (nonatomic, strong)NSArray *entries;




-(id)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)makeProjectIntoDictionary;
-(void)addEntry:(Entries *)entry;
-(void)removeEntry:(Entries *)entry;
- (void)replaceEntry:(Entries *)oldEntry withEntry:(Entries *)newEntry;
-(void)startNewEntry;
-(void)endCurrentEntry;

@end
