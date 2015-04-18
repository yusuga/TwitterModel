//
//  TWFriendships.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWFriendships.h"

@implementation TWFriendships

- (NSDictionary *)relationship
{
    return self.dictionary[@"relationship"];
}

- (TWFriendshipsTarget *)target
{
    return [[TWFriendshipsTarget alloc] initWithDictionary:[self relationship][@"target"]];
}

- (TWFriendshipsSource *)source
{
    return [[TWFriendshipsSource alloc] initWithDictionary:[self relationship][@"source"]];
}

@end

@implementation TWFriendshipsTarget

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}

- (NSString *)idStr
{
    return self.dictionary[@"id_str"];
}

- (NSString *)screenName
{
    return self.dictionary[@"screen_name"];
}

- (BOOL)following
{
    return [self.dictionary[@"following"] boolValue];
}

- (BOOL)followedBy
{
    return [self.dictionary[@"followed_by"] boolValue];
}

@end

@implementation TWFriendshipsSource

- (BOOL)canDM
{
    return [self.dictionary[@"can_dm"] boolValue];
}

- (BOOL)blocking
{
    return [self.dictionary[@"blocking"] boolValue];
}

- (BOOL)muting
{
    return [self.dictionary[@"muting"] boolValue];
}

- (BOOL)allReplies
{
    return [self.dictionary[@"all_replies"] boolValue];
}

- (BOOL)wantRetweets
{
    return [self.dictionary[@"want_retweets"] boolValue];
}

- (BOOL)markedSpam
{
    return [self.dictionary[@"marked_spam"] boolValue];
}

- (BOOL)notificationsEnabled
{
    return [self.dictionary[@"notifications_enabled"] boolValue];
}

@end
