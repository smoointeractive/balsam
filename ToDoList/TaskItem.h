//
//  TaskItem.h
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#ifndef ToDoListItem_h
#define ToDoListItem_h


#endif /* ToDoListItem_h */

#import <Foundation/Foundation.h>

@interface TaskItem : NSObject

@property(nonatomic, readwrite) int taskId;
@property(nonatomic, strong, readwrite) NSString* taskName;
@property(nonatomic, strong, readwrite) NSDate* deadline;
@property(nonatomic, readwrite) Boolean isDeadlineOverdue;
@property(nonatomic, readwrite) Boolean isCompleted;
@property(nonatomic, strong, readwrite) NSString* moreDetails;

-(id)init;

@end
