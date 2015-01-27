//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *inButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *outButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailTableView.dataSource = self;
    self.detailTableView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    self.titleLabel.text = self.project.projectTitle;
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillDisappear:(BOOL)animated{
    if (self.titleLabel.text == nil) {
        return;
    }else{
        self.project.projectTitle = self.titleLabel.text;
        [[ProjectController sharedInstance]addProject:self.project];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addPressed:(id)sender {
}

- (IBAction)inPressed:(id)sender {
    [self.project startNewEntry];
    self.inButton.enabled = NO;
    [self.detailTableView reloadData];
    
}

- (IBAction)outPressed:(id)sender {
    [self.project endCurrentEntry];
    self.inButton.enabled = YES;
    [self.detailTableView reloadData];
}
- (IBAction)reportPressed:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.project.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell Two"];
    if (!cell){
        cell = [UITableViewCell new];
    }
    Entry *entry = [self.project.entries objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@", entry.startTime, entry.endTime];
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
