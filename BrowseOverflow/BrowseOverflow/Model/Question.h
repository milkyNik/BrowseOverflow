//
//  Question.h
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;

@interface Question : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, strong, readonly) NSArray *answers;

- (void)addAnswer:(Answer *)answer;

@end
