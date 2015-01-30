//
//  ListViewController.m
//  Time-Tracker
//
//  Created by Derik Flanary on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ProjectController.h"
#import "DetailViewController.h"


@interface ListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *projects;
@end

@implementation ListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.projects = [ProjectController sharedInstance].projects;
    [self.tableView reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Projects";
    self.tableView= [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *addProjectButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newProject:)];
    self.navigationItem.rightBarButtonItem = addProjectButton;
    
    self.projects = [ProjectController sharedInstance].projects;
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.projects = [ProjectController sharedInstance].projects;
    return [self.projects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell One"];
    if (!cell){
        cell = [UITableViewCell new];
    }
    Project *project = [self.projects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = project.projectTitle;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Project *thisProject = [self.projects objectAtIndex:indexPath.row];
    [ProjectController sharedInstance].project = thisProject;
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.project = thisProject;
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

-(void)newProject:(id)sender{
    DetailViewController *detailViewController = [DetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    Project *newProject = [[ProjectController sharedInstance] addNewProject];
    [ProjectController sharedInstance].project = newProject;
    detailViewController.project = newProject;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray*projectArray = self.projects;
    Project *project= [projectArray objectAtIndex:indexPath.row];
    [[ProjectController sharedInstance] removeProject:project];
    [self.tableView reloadData];

}


@end
