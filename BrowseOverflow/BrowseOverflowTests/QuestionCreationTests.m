//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by iMac on 11.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"

@interface QuestionCreationTests : XCTestCase

@property (nonatomic, strong) StackOverflowManager *manager;
@property (nonatomic, weak) id mockStackOverflowManagerDelegate;

@end

@implementation QuestionCreationTests

- (void)setUp {
    [super setUp];
    self.manager = [[StackOverflowManager alloc] init];
    self.mockStackOverflowManagerDelegate = OCMProtocolMock(@protocol(StackOverflowManagerDelegate));
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.manager = nil;
    self.mockStackOverflowManagerDelegate = nil;
}

- (void)testNonConformingObjectCannotBeDelegate {
    XCTAssertThrows(self.manager.delegate = (id <StackOverflowManagerDelegate>)[NSNull null],
                                             @"NSNull should not be used as the delegate as doesn't coform to the delegate protocol");
}

- (void)testConformingObjectCanBeDelegate {
    id <StackOverflowManagerDelegate> delegate = self.mockStackOverflowManagerDelegate;
    XCTAssertNoThrow(self.manager.delegate = delegate,
                     @"Object conforming to the delegate protocol should be used as the delegate");
}

- (void)testManagerAcceptNilAsDelegate {
    XCTAssertNoThrow(self.manager.delegate = nil,
                     @"It should be acceptable to use nil as an object's delegate");
}

- (void)testAskingForQuestionsMeansRequestingData {
    id mockStackOverflowCommunicator = OCMClassMock([StackOverflowCommunicator class]);
    self.manager.communicator = mockStackOverflowCommunicator;
    
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" andTag:@"iphone"];
    [self.manager fetchQuestionsOnTopic:topic];
    OCMVerify([mockStackOverflowCommunicator searchForQuestionsWithtag:topic.tag]);
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCOmmunicator {
    self.manager.delegate = self.mockStackOverflowManagerDelegate;
    NSError *underlayingError = [NSError errorWithDomain:@"Test domain"
                                                    code:0
                                                userInfo:nil];
    [self.manager searchingForQuestionsFailedWithError:underlayingError];
    OCMStub([self.mockStackOverflowManagerDelegate fetchinError]).andReturn(underlayingError);
//    XCTAssertFalse(underlayingError == [self.manager.delegate fetchError],
//                   @"Error should be at the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlayingError {
    self.manager.delegate = self.mockStackOverflowManagerDelegate;
    NSError *underlayingError = [NSError errorWithDomain:@"Test domain"
                                                    code:0
                                                userInfo:nil];
    [self.manager searchingForQuestionsFailedWithError:underlayingError];
//    XCTAssertEqualObjects([self.manager.delegate fetchError].userInfo[NSUnderlyingErrorKey], underlayingError,
//                          @"The underlaying error should be available to client code");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
