//
//  TaskDetailsViewController.m
//  ToDoList
//
//  Created by Sacha Moo on 11/4/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskDetailsViewController.h"

@implementation TaskDetailsViewController


-(id)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        if(self.taskDetails == nil) {
            self.taskDetails = [[TaskItem alloc]init];
        }
    }
    return self;
}

- (IBAction)StoreTaskNameAction:(id)sender {
    if(self.taskDetails != nil) {
        [self.taskDetails setTaskName:((UITextField*)sender).text];
    }
}

- (IBAction)StoreTaskCompletedStateAction:(id)sender {
    if(self.taskDetails != nil) {
        self.taskDetails.isCompleted = ((UISwitch*)sender).on;
    }
}
- (IBAction)StoreTaskDeadlineAction:(id)sender {
    if(self.taskDetails != nil) {
        [[self taskDetails] setDeadline:((UIDatePicker*)sender).date];
    }
}

- (IBAction)cancelAction:(id)sender {
    if(self.taskDetails != nil)
        self.taskDetails = nil;
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)oKAction:(id)sender {
    [self.taskDetails setMoreDetails:self.taskDescription.text];
    
    if(!self.editMode)
    {
        [self.taskDatasource addTask:self.taskDetails];
    }
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    if(self.taskDetails != nil) {
        [self.taskName setText:self.taskDetails.taskName];
        [self.taskCompleted setOn:self.taskDetails.isCompleted];
        if(self.taskDetails.deadline != nil) {
            [self.taskDeadline setDate:self.taskDetails.deadline];
        }
        [self.taskDescription setText:self.taskDetails.moreDetails];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
