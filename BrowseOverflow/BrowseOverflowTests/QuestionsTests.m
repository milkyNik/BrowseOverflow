//
//  QuestionsTests.m
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"
#import "Answer.h"

@interface QuestionsTests : XCTestCase

@property (nonatomic, strong) Question *question;
@property (nonatomic, strong) Answer *lowScore;
@property (nonatomic, strong) Answer *highScore;

@end

@implementation QuestionsTests

- (void)setUp {
    [super setUp];
    self.question = [[Question alloc] init];
    self.question.date = [NSDate distantPast];
    self.question.title = @"Do iPhones also dream of electric sheep?";
    self.question.score = 42;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [self.question addAnswer:accepted];
    
    self.lowScore = [[Answer alloc] init];
    self.lowScore.score = -4;
    [self.question addAnswer:self.lowScore];
    
    self.highScore = [[Answer alloc] init];
    self.highScore.score = 4;
    [self.question addAnswer:self.highScore];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.question = nil;
    self.lowScore = nil;
    self.highScore = nil;
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

- (void)testQuestionCanHaveAnswerAdded {
    Answer *myAnswer = [[Answer alloc] init];
    XCTAssertNoThrow([self.question addAnswer:myAnswer],
                     @"Must be able to add answer");
}

- (void)testAcceptedAnswerIsFirst {
    XCTAssertTrue([self.question.answers[0] isAccepted],
                  @"Accepted answer comes first");
}

- (void)testHighScoreAnswerBesoreLow {
    NSArray *answers = self.question.answers;
    NSInteger highIndex = [answers indexOfObject:self.highScore];
    NSInteger lowIndex = [answers indexOfObject:self.lowScore];
    XCTAssertTrue(highIndex < lowIndex,
                  @"High-scoring answer come first");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
