//
//  Question.m
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "Question.h"

@interface Question ()

@property (nonatomic, strong) NSMutableSet *answerSet;

@end

@implementation Question

- (instancetype)init {
    self = [super init];
    if (self) {
        _answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addAnswer:(Answer *)answer {
    [self.answerSet addObject:answer];
}

- (NSArray *)answers {
    return [[self.answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
