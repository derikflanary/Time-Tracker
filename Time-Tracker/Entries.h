//
//  Entries.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entries : NSObject

@property (nonatomic, strong)NSString *startTime;
@property (nonatomic, strong)NSString *endTime;
//@property (nonatomic, strong)NSDate *entryTime;

-(id)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)makeEntryIntoDictionary;


@end
