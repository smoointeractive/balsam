//
//  ToDoListItemTests.m
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskItem.h"

@interface ToDoListItemTests : XCTestCase

@end

@implementation ToDoListItemTests

- (void)setUp {
    [super setUp];
}
    
- (void)tearDown {
    [super tearDown];
}

- (void) testCreateInstanceOfToDoListItem {
    // Given
    TaskItem *newListItem;
    
    // When
    newListItem = [TaskItem alloc];
    
    // Then
    XCTAssertNotNil(newListItem, @"No instance of TaskItem exists");
    
    // deallocate TaskItem instance
    newListItem = nil;
}

-(void) testValidateToDoListItemHasAnId {
    // Given
    TaskItem *firstListItem;
    TaskItem *secondListItem;
    
    // When
    firstListItem = [[TaskItem alloc] init];
    secondListItem = [[TaskItem alloc] init];
    
    // Then
    XCTAssertGreaterThan([secondListItem taskId], 0, @"TaskId value should be 2");
}
    
-(void) testValidateToDoListItemHasTask {
    // Given
    TaskItem *newListItem;
    
    // When
    newListItem = [TaskItem alloc];
    [newListItem setTaskName:@"Do something today!"];
    
    // Then
    XCTAssertNotNil(newListItem.taskName, @"TaskItem does not have a task property");
    
    //deallocate TaskItem instance
    newListItem = nil;
}
    
-(void) testValidateToDoListItemHasDeadline {
    // Given
    TaskItem *newListItem;
    NSDate *date = [NSDate distantFuture];
    
    // When
    newListItem = [TaskItem alloc];
    [newListItem setDeadline:date];
    
    // Then
    XCTAssertNotNil([newListItem deadline], @"TaskItem does not have a deadline property");
    
    //deallocate TaskItem instance
    newListItem = nil;
}

-(void)testValidateDeadlineOverdue {
    // Given
    TaskItem *newListItem;
        
    // When
    newListItem = [TaskItem alloc];
    newListItem.isDeadlineOverdue = true;
    
    // Then
    XCTAssertTrue(newListItem.isDeadlineOverdue, @"TaskItem deadlineOverdue is false");
}
    
-(void) testValidateToDoListItemIsCompleted {
    // Given
    TaskItem *newListItem;
        
    // When
    newListItem = [TaskItem alloc];
    [newListItem setIsCompleted:true];
        
    // Then
    XCTAssert(newListItem.isCompleted, @"TaskItem does not have a completed flag property");
        
    // deallocate TaskItem instance
    newListItem = nil;
}
    
-(void) testValidateToDoListItemHasMoreDetails {
    // Given
    TaskItem *newListItem;
    
    // When
    newListItem = [TaskItem alloc];
    [newListItem setMoreDetails:@"Additional informaton about task."];
    
    // Then
    XCTAssert([newListItem moreDetails], @"TaskItem does not have a completed flag property");
    
    // deallocate TaskItem instance
    newListItem = nil;
}

@end
