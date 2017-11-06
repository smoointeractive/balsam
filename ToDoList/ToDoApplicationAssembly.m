//
//  ToDoApplicationAssembly.m
//  ToDoList
//
//  Created by Sacha Moo on 11/2/17.
//  Copyright © 2017 Sacha Moo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoApplicationAssembly.h"

@implementation ToDoApplicationAssembly
-(ViewController*)viewController {
    return [TyphoonDefinition withClass:[ViewController class]
            configuration:^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(taskDatasource) with:[self datasource]];
            }];
}

-(TaskDetailsViewController*) taskDetailsViewController {
    return [TyphoonDefinition withClass:[TaskDetailsViewController class]
            configuration:^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(taskDatasource)with:[self datasource]];
            }];
}

-(ToDoListDataSource*)datasource {
    return [TyphoonDefinition withClass:[ToDoListDataSource class]
            configuration:^(TyphoonDefinition *definition) {
                [definition useInitializer:@selector(init)];
                
                definition.scope = TyphoonScopeSingleton;
            }];
}

@end
