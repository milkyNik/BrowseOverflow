//
//  QuestionsTests.m
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionsTests : XCTestCase

@property (nonatomic, strong) Question *question;

@end

@implementation QuestionsTests

- (void)setUp {
    [super setUp];
    self.question = [[Question alloc] init];
    self.question.date = [NSDate distantPast];
    self.question.title = @"Do iPhones also dream of electric sheep?";
    self.question.score = 42;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.question = nil;
}

- (void)testQuestionHasATitle {
    XCTAssertEqual(self.question.score, 42,
                   @"Question need a numeric score");
}

- (void)testQuestionHasADate {
    NSDate *testDate = [NSDate distantPast];
    self.question.date = testDate;
    XCTAssertEqualObjects(self.question.date, testDate,
                  @"Question needs to provide its date");
}

- (void)testQuestionsKeepScore {
    XCTAssertEqualObjects(self.question.title,
                          @"Do iPhones also dream of electric sheep?",
                          @"Question should know its title");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
