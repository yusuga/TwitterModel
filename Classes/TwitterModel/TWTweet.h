//
//  TWTweet.h
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWUser, TWEntities, TWCoordinates, TWCurrentUserRetweet, TWPlace, TWPlaceAttributes, TWPlaceBoundingBox, TWScopes;

/**
 *  GET statuses/home_timeline
 *  https://dev.twitter.com/rest/reference/get/statuses/home_timeline
 *
 *  Tweets
 *  https://dev.twitter.com/overview/api/tweets
 */
@interface TWTweet : TWObject

- (int64_t)id;
- (NSString *)id_str;
- (NSString *)created_at;
- (TWUser *)user;
- (NSString *)text;
- (TWEntities *)entities;
- (NSUInteger)favorite_count;
- (BOOL)favorited;
- (NSUInteger)retweet_count;
- (BOOL)retweeted;
- (TWTweet *)retweeted_status;
- (int64_t)in_reply_to_status_id;
- (NSString *)in_reply_to_status_id_str;
- (NSString *)in_reply_to_screen_name;
- (int64_t)in_reply_to_user_id;
- (NSString *)in_reply_to_user_id_str;
- (NSString *)lang;
- (TWCurrentUserRetweet *)current_user_retweet;
- (NSString *)filter_level;
- (TWPlace *)place;
- (BOOL)possibly_sensitive;
- (NSString *)source;
- (BOOL)truncated;
- (BOOL)withheld_copyright;
- (NSArray *)withheld_in_countries;         // Array of String
- (NSString *)withheld_scope;

- (id)annotations;
- (NSArray *)contributors;                  // Collection of TWContributor
- (TWCoordinates *)coordinates;
- (TWScopes *)scopes;

@end

/**
 *  Contributors
 *  https://dev.twitter.com/overview/api/tweets#obj-contributors
 */
@interface TWContributor : TWObject

- (int64_t)id;
- (NSString *)id_str;
- (NSString *)screen_name;

@end

/**
 *  Coordinates
 *  https://dev.twitter.com/overview/api/tweets#obj-coordinates
 */
@interface TWCoordinates : TWObject

- (NSArray *)coordinates; // Collection of Float
- (NSString *)type;

@end

/**
 *  Perspectival. Only surfaces on methods supporting the include_my_retweet parameter, when set to true. Details the Tweet ID of the user’s own retweet (if existent) of this Tweet.
 */
@interface TWCurrentUserRetweet : TWObject

- (int64_t)id;
- (NSString *)id_str;

@end

/**
 *  Places
 *  https://dev.twitter.com/overview/api/places
 */
@interface TWPlace : TWObject

- (NSString *)id;
- (NSString *)name;
- (NSString *)full_name;
- (NSString *)place_type;
- (NSString *)url;
- (NSString *)country;
- (NSString *)country_code;
- (TWPlaceAttributes *)attributes;
- (TWPlaceBoundingBox *)bounding_box;

@end

/**
 *  Place Attributes
 *  https://dev.twitter.com/overview/api/places#place_attributes
 */
@interface TWPlaceAttributes : TWObject

- (id)street_address;
- (id)locality;
- (id)region;
- (id)iso3;
- (id)postal_code;
- (id)phone;
- (NSString *)twitter;
- (NSString *)url;
- (NSString *)appID;

@end

/**
 *  Bounding box
 *  https://dev.twitter.com/overview/api/places#obj-boundingbox
 */
@interface TWPlaceBoundingBox : TWObject

- (NSArray *)coordinates;       // Array of Array of Array of Float
- (NSString *)type;

@end

/**
 *  Tweets
 *  https://dev.twitter.com/overview/api/tweets
 */
@interface TWScopes : TWObject

- (BOOL)followers;

@end