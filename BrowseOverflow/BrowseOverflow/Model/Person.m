//
//  Person.m
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)name andAvatarURL:(NSString *)avatarURL {
    self = [super init];
    if (self) {
        _name = [name copy];
        _avatarURL = [[NSURL alloc] initWithString:avatarURL];
    }
    return self;
}

@end
