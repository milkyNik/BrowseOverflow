//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by iMac on 03.09.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Answer.h"
#import "Person.h"

@interface AnswerTests : XCTestCase

@property (nonatomic, strong) Answer *answer;
@property (nonatomic, strong) Answer *otherAnswer;

@end

@implementation AnswerTests

- (void)setUp {
    [super setUp];
    self.answer = [[Answer alloc] init];
    self.answer.text = @"The answer is 42";
    self.answer.person = [[Person alloc] initWithName:@"Nik Milko" andAvatarURL:@"http://example.com/avatar.png"];
    self.answer.score = 42;
    
    self.otherAnswer = [[Answer alloc] init];
    self.otherAnswer.text = @"I have the answer you need";
    self.otherAnswer.score = 42;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.answer = nil;
}

- (void)testAnswerHasSomeText {
    XCTAssertEqualObjects(self.answer.text, @"The answer is 42",
                          @"Answer need to contain some text");
}

- (void)testSomeoneProvidedTheAnswer {
    XCTAssertTrue([self.answer.person isKindOfClass:[Person class]],
                  @"A Person gave this Answer");
}

- (void)testAnswerNotAcceptedByDefault {
    XCTAssertFalse(self.answer.accepted, @"Answer not accepted by default");
}

- (void)testAnswerCanBeAccepted {
    XCTAssertNoThrow(self.answer.accepted == YES,
                     @"It is possible to accept an answer");
}

- (void)testAnswerHasAScore {
    XCTAssertTrue(self.answer.score == 42,
                  @"Answer's score can be retrieved");
}

- (void)testAcceptedAnswerComesBeforeUnaccepted {
    self.otherAnswer.accepted = YES;
    self.otherAnswer.score = self.answer.score + 10;
    
    XCTAssertEqual([self.answer compare:self.otherAnswer], NSOrderedDescending,
                   @"Accepted answer should come first");
    XCTAssertEqual([self.otherAnswer compare:self.answer], NSOrderedAscending,
                   @"Unacceted answer should come last");
}

- (void)testAnswerWithEqualScoresCompareEqually {
    XCTAssertEqual([self.answer compare:self.otherAnswer], NSOrderedSame,
                   @"Both answers of equal rank");
    XCTAssertEqual([self.otherAnswer compare:self.answer], NSOrderedSame,
                   @"Each answer has the same rank");
}

- (void)testLowerScoringAnswerComesAfterHigher {
    self.otherAnswer.score = self.answer.score + 10;
    XCTAssertEqual([self.answer compare:self.otherAnswer], NSOrderedDescending,
                   @"Higher score comes first");
    XCTAssertEqual([self.otherAnswer compare:self.answer], NSOrderedAscending,
                   @"Lower score comes last");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
































@end
