//
//  NSObject+Category.m
//  Category
//
//  Created by Apple on 15/4/21.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg1 withObject:(id)arg2 waitUntilDone:(BOOL)wait {
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (!signature) {
        return;
    }
    
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:signature];
    [invo setTarget:self];
    [invo setSelector:aSelector];
    [invo setArgument:&arg1 atIndex:2];
    [invo setArgument:&arg2 atIndex:3];
    [invo retainArguments];
    [invo performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:wait];
}

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg1 withObject:(id)arg2 {
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (!signature) {
        return;
    }
    
    NSInvocation *invo = [NSInvocation invocationWithMethodSignature:signature];
    [invo setTarget:self];
    [invo setSelector:aSelector];
    [invo setArgument:&arg1 atIndex:2];
    [invo setArgument:&arg2 atIndex:3];
    [invo retainArguments];
    
    [invo performSelectorInBackground:@selector(invoke) withObject:nil];
}

@end
