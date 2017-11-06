//
//  ViewController.h
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoListDataSource.h"
#import "TaskDetailsViewController.h"

@interface ViewController : UITableViewController <UITableViewDelegate>
    @property(nonatomic, strong, readwrite) ToDoListDataSource* taskDatasource;

@end

