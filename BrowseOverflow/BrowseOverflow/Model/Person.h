//
//  Person.h
//  BrowseOverflow
//
//  Created by iMac on 31.08.18.
//  Copyright © 2018 hata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *avatarURL;

- (id)initWithName:(NSString *)name andAvatarURL:(NSString *)avatarURL;

@end
