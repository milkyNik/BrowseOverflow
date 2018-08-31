//
//  Topic.m
//  BrowseOverflow
//
//  Created by iMac on 30.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@interface Topic ()

@property (nonatomic, strong) NSArray *questions;

@end

@implementation Topic

- (id)initWithName:(NSString *)name andTag:(NSString *)tag {
    self = [super init];
    if (self) {
        _name = [name copy];
        _tag = [tag copy];
        _questions = [[NSArray alloc] init];
    }
    return self;
}

- (void)addQuestion:(Question *)question {
    self.questions = [self.questions arrayByAddingObject:question];
    if ([self.questions count] == 21) {
        NSMutableArray *tempQuestions = [self.questions mutableCopy];
        [tempQuestions removeObjectAtIndex:0];
        self.questions = [tempQuestions copy];
    }
}

- (NSArray *)recentQuestions {
    return [self.questions sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Question *question_1 = (Question *)obj1;
        Question *question_2 = (Question *)obj2;
        return [question_2.date compare:question_1.date];
    }];;
}

@end
