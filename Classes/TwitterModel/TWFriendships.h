//
//  TWFriendships.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWFriendshipsTarget, TWFriendshipsSource;

/**
 *  GET friendships/show
 *  https://dev.twitter.com/rest/reference/get/friendships/show
 */
@interface TWFriendships : TWObject

- (NSDictionary *)relationship;
- (TWFriendshipsTarget *)target;
- (TWFriendshipsSource *)source;

@end

@interface TWFriendshipsTarget : TWObject

- (int64_t)id;
- (NSString *)idStr;
- (NSString *)screenName;
- (BOOL)following;
- (BOOL)followedBy;

@end

@interface TWFriendshipsSource : TWFriendshipsTarget

- (BOOL)canDM;
- (BOOL)blocking;
- (BOOL)muting;
- (BOOL)allReplies;
- (BOOL)wantRetweets;
- (BOOL)markedSpam;
- (BOOL)notificationsEnabled;

@end