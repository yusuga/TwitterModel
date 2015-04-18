//
//  TWUser.h
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWUserEntities, TWEntities, TWTweet;

/**
 *  Users
 *  https://dev.twitter.com/overview/api/users
 */
@interface TWUser : TWObject

- (int64_t)id;
- (NSString *)id_str;
- (NSString *)created_at;
- (NSString *)screen_name;
- (NSString *)name;
- (NSString *)description;
- (NSString *)url;
- (TWUserEntities *)entities;
- (NSUInteger)statuses_count;
- (NSUInteger)favourites_count;
- (NSUInteger)followers_count;
- (NSUInteger)friends_count;
- (NSUInteger)listed_count;
- (BOOL)following;
- (BOOL)follow_request_sent;
- (BOOL)protected;
- (TWTweet *)status;
- (BOOL)default_profile;
- (BOOL)default_profile_image;
- (NSString *)profile_image_url;
- (NSString *)profile_image_url_https;
- (NSString *)profile_banner_url;
- (NSString *)profile_background_color;
- (NSString *)profile_background_image_url;
- (NSString *)profile_background_image_url_https;
- (BOOL)profile_background_tile;
- (BOOL)profile_use_background_image;
- (NSString *)profile_text_color;
- (NSString *)profile_link_color;
- (NSString *)profile_sidebar_border_color;
- (NSString *)profile_sidebar_fill_color;
- (BOOL)show_all_inline_media;
- (NSString *)lang;
- (NSString *)location;
- (NSUInteger)utc_offset;
- (NSString *)time_zone;
- (BOOL)verified;
- (BOOL)notifications;
- (BOOL)geo_enabled;
- (BOOL)is_translator;
- (BOOL)contributors_enabled;
- (NSString *)withheld_in_countries;
- (NSString *)withheld_scope;

@end

@interface TWUserEntities : TWObject

- (TWEntities *)url;
- (TWEntities *)description;

@end