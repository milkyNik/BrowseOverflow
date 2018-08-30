//
//  Topic.m
//  BrowseOverflow
//
//  Created by iMac on 30.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "Topic.h"

@implementation Topic

- (id)initWithName:(NSString *)name andTag:(NSString *)tag {
    self = [super init];
    if (self) {
        _name = name;
        _tag = tag;
    }
    return self;
}

- (NSArray *)recentQuestions {
    return [NSArray array];
}

@end
