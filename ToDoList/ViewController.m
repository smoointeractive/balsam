//
//  ViewController.m
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import "ViewController.h"

NSString *navigationBarTitle = @"My ToDo List";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem* addButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                  target:self action:@selector(addNewTask)];
    self.navigationItem.title = navigationBarTitle;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
   // self.tableView.editing = YES;
    self.tableView.delegate = self;
    
    if(self.taskDatasource != nil) {
        self.tableView.dataSource = self.taskDatasource;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:YES];
    
    
}

- (void)addNewTask {
    [self performSegueWithIdentifier:@"AddTaskSeque" sender:nil];
}

- (IBAction)removeTaskAction:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TaskItem *selectedTask = self.taskDatasource.ToDoListArray[indexPath.row];
    NSLog(@" indexPath: %ld", (long)indexPath.row);
    [[self taskDatasource] deleteTask:selectedTask];
    
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"SelectTaskDetailSegue"])
    {
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        TaskItem* taskData = self.taskDatasource.ToDoListArray[indexPath.row];
        UINavigationController *uiNavController = segue.destinationViewController;
        TaskDetailsViewController *viewController = (TaskDetailsViewController*)uiNavController.topViewController;

        viewController.TaskDetails = taskData;
        viewController.editMode = true;
    }
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"SelectTaskDetailSegue" sender:tableView];
}

@end
