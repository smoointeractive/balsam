//
//  ToDoListDataSource.m
//  ToDoList
//
//  Created by Sacha Moo on 11/3/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoListDataSource.h"

@implementation ToDoListDataSource

-(id)init {
    if(self = [super init]) {
        self.ToDoListArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addTask:(TaskItem *)task {
    if(self.ToDoListArray != nil) {
        [[self ToDoListArray]addObject:task];
    }
}

-(void)deleteLastTask {
    if(self.ToDoListArray != nil) {
        [[self ToDoListArray] removeLastObject];
    }
}

-(void)deleteTask:(TaskItem *)task {
    if(self.ToDoListArray != nil) {
        [[self ToDoListArray] removeObject:task];
    }
}

-(void)checkIfdeadlineIsOverdue:(TaskItem *)taskItem {
    NSDate* currentDate = [[NSDate alloc]init];
    NSDate* resultingDate;
    
    if(taskItem != nil && taskItem.deadline != nil) {
        resultingDate = [currentDate laterDate:taskItem.deadline];
        
        NSLog(@"currentDate: %@", currentDate.description);
        NSLog(@"resultingDate: %@", resultingDate.description);
        
        if([currentDate isEqualToDate:resultingDate]) {
            taskItem.isDeadlineOverdue = true;
        } else {
            taskItem.isDeadlineOverdue = false;
        }
    }
}

-(void)updateCellWhenDeadlineOverdue:(TaskItem *)taskItem selectedCell:(UITableViewCell *)cell {
    if(taskItem != nil && cell != nil) {
        if(taskItem.isDeadlineOverdue) {
            [cell setBackgroundColor:[UIColor yellowColor]];
        } else {
            [cell setBackgroundColor:[UIColor whiteColor]];
        }
    }
}

-(TaskItem*)taskAtIndexPath:(NSIndexPath *)indexPath {
    return self.ToDoListArray[(NSInteger)indexPath.row];
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return self.ToDoListArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* TaskIdentifier = @"TaskIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:TaskIdentifier];
    
    TaskItem* task = [self taskAtIndexPath:indexPath];
    [cell.textLabel setText:task.taskName];
    
    [self checkIfdeadlineIsOverdue:task];
    [self updateCellWhenDeadlineOverdue:task selectedCell:cell];
    
    if(task.deadline != nil) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocalizedDateFormatFromTemplate:@"MMYYddhhmm"];
        NSString *taskCompleted = (task.isCompleted)?@"Completed -- " : @"";
        cell.detailTextLabel.text = [taskCompleted stringByAppendingString:[dateFormatter stringFromDate:task.deadline]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableview cell editing style: %ld", (long)editingStyle);
    
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.ToDoListArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    [tableView reloadData];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

@end

