//
//  Projects.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Projects : NSObject

@property (nonatomic, strong)NSString *projectTitle;
@property (nonatomic, strong)NSString *projectText;
@property (nonatomic, strong)NSDate *projectTime;

-(id)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)makeProjectIntoDictionary;

@end
