//
//  ToDoListDataSource.h
//  ToDoList
//
//  Created by Sacha Moo on 11/3/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#ifndef ToDoListDataSource_h
#define ToDoListDataSource_h


#endif /* ToDoListDataSource_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TaskItem.h"

@interface ToDoListDataSource : NSObject <UITableViewDataSource>

@property(nonatomic, strong, readwrite) NSMutableArray* ToDoListArray;

-(id)init;
-(void)addTask:(TaskItem*) task;
-(void)deleteLastTask;
-(void)deleteTask:(TaskItem*) task;
-(TaskItem*)taskAtIndexPath:(NSIndexPath*) indexPath;
-(NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell*)tableView:(UITableView*)tableView
       cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
-(void)checkIfdeadlineIsOverdue:(TaskItem*) taskItem;
-(void)updateCellWhenDeadlineOverdue:(TaskItem*)taskItem
                         selectedCell:(UITableViewCell*)cell;
@end
