//
//  TaskDetailsViewControllerTests.m
//  ToDoList
//
//  Created by Sacha Moo on 11/4/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskDetailsViewController.h"
#import "TaskItem.h"
#import "ToDoListDataSource.h"

@interface TaskDetailsViewControllerTests : XCTestCase

@end

@implementation TaskDetailsViewControllerTests

TaskDetailsViewController* taskDetailsViewController;


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    taskDetailsViewController = [TaskDetailsViewController alloc];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    taskDetailsViewController = nil;
}

- (void)testValidateToDoListItemProperty {
    // Given
    TaskItem* taskDetails = [[TaskItem alloc] init];
    
    // When
    [taskDetailsViewController setTaskDetails:taskDetails];
    
    // Then
    XCTAssertEqual(taskDetailsViewController.taskDetails, taskDetails, @"Theses objects are not equal.");
}

-(void)testValidateEditModeProperty {
    // Given
    Boolean expectedResult = true;
    
    // When
    taskDetailsViewController.editMode = true;
    
    // Then
    XCTAssertEqual(taskDetailsViewController.editMode, expectedResult, @"expressions are not equal");
}

- (void)testValidateToDoListDataSourceProperty {
    // Given
    ToDoListDataSource* toDoListDatasource = [[ToDoListDataSource alloc]init];
    
    // When
    taskDetailsViewController.taskDatasource = toDoListDatasource;
    
    // Then
    XCTAssertEqual(taskDetailsViewController.taskDatasource, toDoListDatasource, @"These object are not equal");
}

- (void)testCancelAction {
    // Given
    TaskItem *taskDetails = [[TaskItem alloc] init];
    [taskDetailsViewController setTaskDetails:taskDetails];
    
    // When
    [taskDetailsViewController cancelAction:self];
    
    // Then
    XCTAssertNil(taskDetailsViewController.taskDetails, @"is not nil");
}

- (void)testOkAction {
    // Given
    ToDoListDataSource* newDatasource = [[ToDoListDataSource alloc]init];
    taskDetailsViewController.taskDatasource = newDatasource;
    TaskItem *newTaskDetails = [[TaskItem alloc] init];
    [newTaskDetails setTaskName:@"Do something today."];
    
    // When
    [taskDetailsViewController setTaskDetails:newTaskDetails];
    [taskDetailsViewController oKAction:self];
    
    // Then
    XCTAssertGreaterThan(taskDetailsViewController.taskDatasource.ToDoListArray.count, 0, @"the expression 1 is not greater than expression 2");
}

@end
