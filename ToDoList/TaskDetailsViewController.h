//
//  TaskDetailsViewController.h
//  ToDoList
//
//  Created by Sacha Moo on 11/4/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#ifndef TaskDetailsViewController_h
#define TaskDetailsViewController_h


#endif /* TaskDetailsViewController_h */

#import <UIKit/UIKit.h>
#import "TaskItem.h"
#import "ToDoListDataSource.h"

@interface TaskDetailsViewController : UIViewController

@property(nonatomic, readwrite) Boolean editMode;
@property(nonatomic, strong, readwrite) TaskItem *taskDetails;
@property(nonatomic, strong, readwrite) ToDoListDataSource *taskDatasource;
@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UISwitch *taskCompleted;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDeadline;
@property (weak, nonatomic) IBOutlet UITextView *taskDescription;

-(IBAction) cancelAction:(id)sender;
-(IBAction) oKAction:(id)sender;

@end
