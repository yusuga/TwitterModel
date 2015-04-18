//
//  TWMappedTweets.m
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWMappedTweets.h"
#import "TWTweet.h"

@implementation TWMappedTweets

- (NSDictionary *)id
{
    return self.dictionary[@"id"];
}

- (TWTweet *)tweetForID:(int64_t)tweetID
{
    return [[TWTweet alloc] initWithDictionary:[[self id] objectForKey:[NSString stringWithFormat:@"%lld", tweetID]]];
}

@end