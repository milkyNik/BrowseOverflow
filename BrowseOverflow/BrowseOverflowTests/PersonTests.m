//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@property (nonatomic, strong) Person *person;

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    self.person = [[Person alloc] initWithName:@"Nik Milko" andAvatarURL:@"http://example.com/avatar.png"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.person = nil;
}

- (void)testThatPersonHasTheRightName {
    XCTAssertEqualObjects(self.person.name, @"Nik Milko",
                          @"Expecting a person to provide its name");
}

- (void)testThatPersonHasAnAvatarURL {
    NSURL *url = self.person.avatarURL;
    XCTAssertEqualObjects([url absoluteString], @"http://example.com/avatar.png",
                          @"The Person's avatar should be represented by a URL");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
