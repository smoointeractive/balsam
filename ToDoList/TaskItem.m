//
//  TaskItem.m
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskItem.h"

static int taskIdCounter = 1;

@implementation TaskItem

-(id) init {
    if(self = [super init]) {
        self.taskId = taskIdCounter;
        taskIdCounter++;
    }
    return self;
}

@end
