//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by iMac on 30.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"

@interface TopicTests : XCTestCase

@property (nonatomic, strong) Topic *testTopic;

@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    self.testTopic = [[Topic alloc] initWithName:@"iPhone" andTag:@"iphone"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.testTopic = nil;
}

- (void)testThatTopicExist {
    XCTAssertNotNil(self.testTopic,
                    @"Should be able to create a Topic instance");
}

- (void)testThatTopicCanBeName {
    XCTAssertEqualObjects(self.testTopic.name, @"iPhone",
                          @"The Topic should have the name I gave it");
}

- (void)testThatTopicHasATag {
    XCTAssertEqualObjects(self.testTopic.tag, @"iphone",
                          @"Topics need to have tags");
}

- (void)testForAListOfQuestions {
    XCTAssertTrue([[self.testTopic recentQuestions] isKindOfClass:[NSArray class]],
                  @"Topics should provide a list of recent questions");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
