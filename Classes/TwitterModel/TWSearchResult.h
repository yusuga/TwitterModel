//
//  TWSearchResult.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@import CoreGraphics;
@class TWSearchMetadata;

/**
 *  GET search/tweets
 *  https://dev.twitter.com/rest/reference/get/search/tweets
 */
@interface TWSearchResult : TWObject

- (TWSearchMetadata *)search_metadata;
- (NSArray *)statuses;                  // Array of Tweet dictionary
- (NSArray *)statuseObjects;            // Array of TWTweet

@end

@interface TWSearchMetadata : TWObject

- (NSString *)query;                    // e.g. "%23freebandnames"
- (int64_t)max_id;                      // e.g. 250126199840518145
- (NSString *)max_id_str;               // e.g. "250126199840518145"
- (int64_t)since_id;                    // e.g. 24012619984051000,
- (NSString *)since_id_str;             // e.g. "24012619984051000"
- (NSUInteger)count;                    // e.g. 4
- (NSString *)refresh_url;              // e.g. "?since_id=250126199840518145&q=%23freebandnames&result_type=mixed&include_entities=1"
- (NSString *)next_results;             // e.g. "?max_id=249279667666817023&q=%23freebandnames&count=4&include_entities=1&result_type=mixed"
- (CGFloat)completed_in;                // e.g. 0.035

- (int64_t)nextMaxID;
- (BOOL)isAllGot;

@end