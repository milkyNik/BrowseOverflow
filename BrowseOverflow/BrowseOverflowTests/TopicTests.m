//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by iMac on 30.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"
#import "Question.h"

@interface TopicTests : XCTestCase

@property (nonatomic, strong) Topic *topic;

@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    self.topic = [[Topic alloc] initWithName:@"iPhone" andTag:@"iphone"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.topic = nil;
}

- (void)testThatTopicExist {
    XCTAssertNotNil(self.topic,
                    @"Should be able to create a Topic instance");
}

- (void)testThatTopicCanBeName {
    XCTAssertEqualObjects(self.topic.name, @"iPhone",
                          @"The Topic should have the name I gave it");
}

- (void)testThatTopicHasATag {
    XCTAssertEqualObjects(self.topic.tag, @"iphone",
                          @"Topics need to have tags");
}

- (void)testForAListOfQuestions {
    XCTAssertTrue([[self.topic recentQuestions] isKindOfClass:[NSArray class]],
                  @"Topics should provide a list of recent questions");
}

- (void)testForInitiallyEmptyQuestionsList {
    XCTAssertEqual([[self.topic recentQuestions] count], 0,
                   @"No questions added yet, count should be zero");
}

- (void)testAddingAQuestionToTheList {
    Question *question = [[Question alloc] init];
    [self.topic addQuestion:question];
    XCTAssertEqual([[self.topic recentQuestions] count], 1,
                   @"Add a question, and the count of questions should go up");
}

- (void)testQuestionsAreListedChronologically {
    Question *question_1 = [[Question alloc] init];
    question_1.date = [NSDate distantPast];
    
    Question *question_2 = [[Question alloc] init];
    question_2.date = [NSDate distantFuture];
    
    [self.topic addQuestion:question_1];
    [self.topic addQuestion:question_2];
    
    NSArray *questions = [self.topic recentQuestions];
    
    Question *listedFirst = questions[0];
    Question *listenSecond = questions[1];
    
    XCTAssertEqualObjects([listedFirst.date laterDate:listenSecond.date], listedFirst.date,
                          @"The later question should appear first in the list");
}

- (void)testLimitOfTwentyQuestions {
    Question *question = [[Question alloc] init];
    for (int i = 0; i < 25; i++) {
        [self.topic addQuestion:question];
    }
    XCTAssertTrue([[self.topic recentQuestions] count] < 21,
                  @"There should never be more twenty questions");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
