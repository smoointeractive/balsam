//
//  ToDoApplicationAssembly.h
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAssembly.h"
#import "ViewController.h"
#import "TaskDetailsViewController.h"
#import "ToDoListDataSource.h"

//@class ViewController;

@interface ToDoApplicationAssembly : TyphoonAssembly
-(ViewController*)viewController;
-(TaskDetailsViewController*)taskDetailsViewController;
-(ToDoListDataSource *)datasource;
@end
