//
//  Topic.h
//  BrowseOverflow
//
//  Created by iMac on 30.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *tag;

- (id)initWithName:(NSString *)name andTag:(NSString *)tag;

- (NSArray *)recentQuestions;

@end
