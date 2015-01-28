//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomEntryViewController.h"



@interface DetailViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *inButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *outButton;

@end

@implementation DetailViewController

-(void)updateThisProject:(Project *)project{
    self.titleLabel.text = self.project.projectTitle;
    self.timeLabel.text = [self.project setProjectTime];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailTableView.dataSource = self;
    self.detailTableView.delegate = self;
    self.updatedProject = self.project;
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self updateThisProject:self.updatedProject];
}

-(void)viewDidAppear:(BOOL)animated{
    self.timeLabel.text = [self.updatedProject setProjectTime];
    //[self updateThisProject:self.updatedProject];
}

-(void)savePressed:(id)selector{
    if([self.titleLabel.text  isEqual: @""]){
        UIAlertController *setTitleAlert = [UIAlertController alertControllerWithTitle:@"No Project Title" message:@"Please insert a title and then click save again" preferredStyle:UIAlertControllerStyleAlert];
        [setTitleAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }]];
        [self presentViewController:setTitleAlert animated:YES completion:nil];
    
    }else if (self.project == nil) {
        self.project.projectTitle = self.titleLabel.text;
        [[ProjectController sharedInstance]addProject:self.project];
    }else{
        
        self.updatedProject.projectTitle = self.titleLabel.text;
        //self.updatedProject.entries = self.project.entries;
        [[ProjectController sharedInstance]replaceProject:self.project withEntry:self.updatedProject];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addPressed:(id)sender {
    CustomEntryViewController *customViewController = [CustomEntryViewController new];
    customViewController.project = self.updatedProject;
    [self.navigationController pushViewController:customViewController animated:YES];
}

- (IBAction)inPressed:(id)sender {
    [self.updatedProject startNewEntry];
    self.inButton.enabled = NO;
    [self.detailTableView reloadData];
    
}

- (IBAction)outPressed:(id)sender {
    [self.updatedProject endCurrentEntry];
    self.inButton.enabled = YES;
    [self.detailTableView reloadData];
    self.timeLabel.text = [self.updatedProject setProjectTime];
}
- (IBAction)reportPressed:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.updatedProject.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell Two"];
    if (!cell){
        cell = [UITableViewCell new];
    }
    Entry *entry = [self.updatedProject.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@", entry.startTime, entry.endTime];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:9];
    return cell;
}

-(void)dismissKeyboard{
    [self.titleLabel resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
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
