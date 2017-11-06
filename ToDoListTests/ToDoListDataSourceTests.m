//
//  ToDoListDataSourceTests.m
//  ToDoList
//
//  Created by Sacha Moo on 11/3/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ToDoListDataSource.h"
#import "TaskItem.h"

@interface ToDoListDataSourceTests : XCTestCase

@end

@implementation ToDoListDataSourceTests
    
ToDoListDataSource *dataSource;
    
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    dataSource = nil;
}

/*- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}*/

-(void)testValidateToDoListArray {
    // Given
    dataSource = [ToDoListDataSource alloc];
    
    // When
    NSMutableArray* data = [[NSMutableArray alloc]init];
    [dataSource setToDoListArray:data];
    
    // Then
    XCTAssertNotNil([dataSource ToDoListArray], @"There is no array object.");
}

-(void)testValidateToDoListArrayLength {
    // Given
    dataSource = [ToDoListDataSource alloc];
    
    // When
    NSMutableArray* data = [[NSMutableArray alloc]init];
    [data addObject:@"Item 1"];
    [dataSource setToDoListArray:data];
    
    // Then
    XCTAssertGreaterThan([[dataSource ToDoListArray]count], 0, @"There are no elements in array.");
}

-(void)testCreateTask {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem* newTask = [TaskItem alloc];
    
    // When
    [dataSource addTask:newTask];
    
    // Then
    XCTAssertGreaterThan([[dataSource ToDoListArray]count], 0, @"There are no elements in array.");
}

-(void)testDeleteTask {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem* newTask = [TaskItem alloc];
    
    // When
    [dataSource addTask:newTask];
    
    // Then
    [dataSource deleteLastTask];
    XCTAssertLessThan([[dataSource ToDoListArray]count], 1, @"Array still has an element.");
}

-(void)testDeleteSelectedTask {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem *taskOne = [TaskItem alloc];
    [taskOne setTaskName:@"Do something today!"];
    TaskItem *taskTwo = [TaskItem alloc];
    [taskTwo setTaskName:@"Do something tomorrow!"];
    
    // When
    [dataSource addTask:taskOne];
    [dataSource addTask:taskTwo];
    
    // Then
    [dataSource deleteTask:taskOne];
    XCTAssert([dataSource.ToDoListArray indexOfObject:taskOne], @"Task found.");
}

// Note UITableView boiler plate code
-(void)testValidateAtIndexPathMethod {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem* task = [TaskItem alloc];
    TaskItem* task2 = [TaskItem alloc];
    NSIndexPath* selectedIndex = [NSIndexPath indexPathForItem:0 inSection:0];
    
    // When
    [task setTaskName:@"Do Something today!"];
    [task setIsCompleted:false];
    [dataSource addTask:task];
    [dataSource addTask:task2];
    
    TaskItem* expectedValue = [dataSource taskAtIndexPath:selectedIndex];
    
    // Then
    XCTAssertEqual(task, expectedValue, @"Task items are not the same.");
}

-(void)testValidateTableViewIntegerMethod {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem* task = [TaskItem alloc];
    TaskItem* task2 = [TaskItem alloc];
    NSInteger expectedCount = 2;

    // When
    [task setTaskName:@"Do Something today!"];
    [task2 setTaskName:@"Do Something tomorrow!"];
    [dataSource addTask:task];
    [dataSource addTask:task2];
    
    // Then
    XCTAssertEqual(expectedCount, [dataSource tableView:nil numberOfRowsInSection:0], @"The expected value is not the same");
}

-(void)testCheckIfDeadlineOverdue {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem *newListItem = [TaskItem alloc];
    [newListItem setDeadline:[NSDate distantPast]];
    newListItem.isDeadlineOverdue = false;
    
    // When
    [dataSource checkIfdeadlineIsOverdue:newListItem];
    
    // Then
    XCTAssertTrue(newListItem.isDeadlineOverdue, @"deadline is not overdue");
}

-(void)testUpdateCellWhenDeadlineOverdue {
    // Given
    dataSource = [[ToDoListDataSource alloc] init];
    TaskItem *newListItem = [TaskItem alloc];
    [newListItem setDeadline:[NSDate distantPast]];
    newListItem.isDeadlineOverdue = false;
    UITableViewCell* cell = [[UITableViewCell alloc]init];
    UIColor* expectedResult = [UIColor yellowColor];
    
    // When
    [dataSource checkIfdeadlineIsOverdue:newListItem];
    [dataSource updateCellWhenDeadlineOverdue:newListItem selectedCell:cell];
    
    // Then
    XCTAssertEqual(expectedResult, cell.backgroundColor, @"cell backgroundColor is not yellow.");
}

@end
