//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by iMac on 11.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StackOverflowCommunicator, Topic;

@protocol StackOverflowManagerDelegate <NSObject>

- (NSError *)fetchinError;

- (void)fetchingQuestionsOnTopic:(Topic *)topic
                failedWithErrror:(NSError *)error;

@end

extern NSString *StackOverflowManagerError;

enum {
    StackOverflowManagerErrorQuestionSearchCode
};

@interface StackOverflowManager : NSObject

@property (nonatomic, weak) id <StackOverflowManagerDelegate> delegate;
@property (nonatomic, strong) StackOverflowCommunicator *communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;

- (void)searchingForQuestionsFailedWithError:(NSError *)error;

@end
