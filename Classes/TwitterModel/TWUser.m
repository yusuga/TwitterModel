//
//  TWUser.m
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWUser.h"
#import "TWTweet.h"
#import "TWEntities.h"

@implementation TWUser
{
    TWUserEntities *_entities;
    TWTweet *_status;
}

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}

- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

- (NSString *)created_at
{
    return self.dictionary[@"created_at"];
}

- (NSString *)screen_name
{
    return self.dictionary[@"screen_name"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)description
{
    return self.dictionary[@"description"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

- (TWUserEntities *)entities
{
    if (!_entities) {
        _entities = [[TWUserEntities alloc] initWithDictionary:self.dictionary[@"entities"]];
    }
    return _entities;
}

- (NSUInteger)statuses_count
{
    return [self.dictionary[@"statuses_count"] unsignedIntegerValue];
}

- (NSUInteger)favourites_count
{
    return [self.dictionary[@"favourites_count"] unsignedIntegerValue];
}

- (NSUInteger)followers_count
{
    return [self.dictionary[@"followers_count"] unsignedIntegerValue];
}

- (NSUInteger)friends_count
{
    return [self.dictionary[@"friends_count"] unsignedIntegerValue];
}

- (NSUInteger)listed_count
{
    return [self.dictionary[@"listed_count"] unsignedIntegerValue];
}

- (BOOL)following
{
    return [self.dictionary[@"following"] boolValue];
}

- (BOOL)follow_request_sent
{
    return [self.dictionary[@"follow_request_sent"] boolValue];
}

- (BOOL)protected
{
    return [self.dictionary[@"protected"] boolValue];
}

- (TWTweet *)status
{
    if (!_status) {
        _status = [[TWTweet alloc] initWithDictionary:self.dictionary[@"status"]];
    }
    return _status;
}

- (BOOL)default_profile
{
    return [self.dictionary[@"default_profile"] boolValue];
}

- (BOOL)default_profile_image
{
    return [self.dictionary[@"default_profile_image"] boolValue];
}

- (NSString *)profile_image_url
{
    return self.dictionary[@"profile_image_url"];
}

- (NSString *)profile_image_url_https
{
    return self.dictionary[@"profile_image_url_https"];
}

- (NSString *)profile_banner_url
{
    return self.dictionary[@"profile_banner_url"];
}

- (NSString *)profile_background_color
{
    return self.dictionary[@"profile_background_color"];
}

- (NSString *)profile_background_image_url
{
    return self.dictionary[@"profile_background_image_url"];
}

- (NSString *)profile_background_image_url_https
{
    return self.dictionary[@"profile_background_image_url_https"];
}

- (BOOL)profile_background_tile
{
    return [self.dictionary[@"profile_background_tile"] boolValue];
}

- (BOOL)profile_use_background_image
{
    return [self.dictionary[@"profile_use_background_image"] boolValue];
}

- (NSString *)profile_text_color
{
    return self.dictionary[@"profile_text_color"];
}

- (NSString *)profile_link_color
{
    return self.dictionary[@"profile_link_color"];
}

- (NSString *)profile_sidebar_border_color
{
    return self.dictionary[@"profile_sidebar_border_color"];
}

- (NSString *)profile_sidebar_fill_color
{
    return self.dictionary[@"profile_sidebar_fill_color"];
}

- (BOOL)show_all_inline_media
{
    return [self.dictionary[@"show_all_inline_media"] boolValue];
}

- (NSString *)lang
{
    return self.dictionary[@"lang"];
}

- (NSString *)location
{
    return self.dictionary[@"location"];
}

- (NSUInteger)utc_offset
{
    return [self.dictionary[@"utc_offset"] unsignedIntegerValue];
}

- (NSString *)time_zone
{
    return self.dictionary[@"time_zone"];
}

- (BOOL)verified
{
    return [self.dictionary[@"verified"] boolValue];
}

- (BOOL)notifications
{
    return [self.dictionary[@"notifications"] boolValue];
}

- (BOOL)geo_enabled
{
    return [self.dictionary[@"geo_enabled"] boolValue];
}

- (BOOL)is_translator
{
    return [self.dictionary[@"is_translator"] boolValue];
}

- (BOOL)contributors_enabled
{
    return [self.dictionary[@"contributors_enabled"] boolValue];
}

- (NSString *)withheld_in_countries
{
    return self.dictionary[@"withheld_in_countries"];
}

- (NSString *)withheld_scope
{
    return self.dictionary[@"withheld_scope"];
}

@end

@implementation TWUserEntities
{
    TWEntities *_url;
    TWEntities *_description;
}

- (TWEntities *)url
{
    if (!_url) {
        _url = [[TWEntities alloc] initWithDictionary:self.dictionary[@"url"]];
    }
    return _url;
}

- (TWEntities *)description
{
    if (!_description) {
        _description = [[TWEntities alloc] initWithDictionary:self.dictionary[@"description"]];
    }
    return _description;
}

@end