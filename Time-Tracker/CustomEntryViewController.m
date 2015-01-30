//
//  CustomEntryViewController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomEntryViewController.h"
#import "ProjectController.h"


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
    NSTimeInterval distanceBetweenDates = [self.endTimePicker.date timeIntervalSinceDate:self.startTimePicker.date];
    if (distanceBetweenDates < 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"End Date Is Before Start Date" message:@"Your end date most take place after your start date" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    entry.startTime = self.startTimePicker.date;
    entry.endTime = self.endTimePicker.date;
    [[ProjectController sharedInstance] addEntry:entry];
    
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
