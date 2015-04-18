//
//  TWMappedTweets.h
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWTweet;

/**
 *  GET statuses/lookup
 *  https://dev.twitter.com/rest/reference/get/statuses/lookup
 *
 *  e.g. https://api.twitter.com/1.1/statuses/lookup.json?id=20,432656548536401920&map=1
 *
 *  {
 *      "id":{
 *          "20":{
 *              <tweet>
 *          },
 *          "432656548536401920":{
 *              <tweet>
 *          }
 *      }
 *  }
 */

@interface TWMappedTweets : TWObject

- (NSDictionary *)id;
- (TWTweet *)tweetForID:(int64_t)tweetID;

@end