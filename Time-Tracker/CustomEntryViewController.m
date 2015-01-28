//
//  CustomEntryViewController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomEntryViewController.h"


@interface CustomEntryViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *startTimePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTimePicker;

@end

@implementation CustomEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveEntryPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveEntryPressed:(id)selector{
    Entry *entry = [Entry new];
    entry.startTime = self.startTimePicker.date;
    entry.endTime = self.endTimePicker.date;
    [self.project addEntry:entry];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
