//
//  Answer.h
//  BrowseOverflow
//
//  Created by iMac on 03.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Answer : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) Person *person;
@property (nonatomic, assign, getter = isAccepted) BOOL accepted;
@property (nonatomic, assign) NSInteger score;

- (NSComparisonResult)compare:(Answer *)other;

@end
