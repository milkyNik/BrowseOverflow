//
//  Answer.m
//  BrowseOverflow
//
//  Created by iMac on 03.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "Answer.h"

@implementation Answer

- (NSComparisonResult)compare:(Answer *)other {
    if (self.accepted && !other.accepted) {
        return NSOrderedAscending;
    } else if (!self.accepted && other.accepted) {
        return NSOrderedDescending;
    }
    
    if (self.score > other.score) {
        return NSOrderedAscending;
    } else if (self.score < other.score) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@end
