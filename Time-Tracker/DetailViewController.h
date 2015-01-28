//
//  DetailViewController.h
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProjectController.h"

@interface DetailViewController : UIViewController
@property (nonatomic, strong)Project *project;
@property (nonatomic, strong)Project *updatedProject;


@end
