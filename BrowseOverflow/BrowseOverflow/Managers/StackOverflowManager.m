//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by iMac on 11.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

@implementation StackOverflowManager

- (void)setDelegate:(id<StackOverflowManagerDelegate>)delegate {
    if (delegate && ![delegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException
                                reason:@"Delegate object does not conform to the delegate protocol"
                              userInfo:nil] raise];
    } else {
        _delegate = delegate;
    }
}

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    [self.communicator searchForQuestionsWithtag:topic.tag];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error
                                                          forKey:NSUnderlyingErrorKey];
    
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    [self.delegate fetchingQuestionsOnTopic:nil
                           failedWithErrror:reportableError];
}

@end
