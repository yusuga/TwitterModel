//
//  TWTweet.m
//
//  Created by Yu Sugawara on 4/16/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWTweet.h"
#import "TWUser.h"
#import "TWEntities.h"

@implementation TWTweet
{
    TWUser *_user;
    TWEntities *_entities;
    TWExtendedEntities *_extended_entities;
    TWTweet *_retweeted_status;
    NSArray *_contributorObjects;
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

- (TWUser *)user
{
    if (!_user) {
        _user = [[TWUser alloc] initWithDictionary:self.dictionary[@"user"]];
    }
    return _user;
}

- (NSString *)text
{
    return self.dictionary[@"text"];
}

- (TWEntities *)entities
{
    if (!_entities) {
        _entities = [[TWEntities alloc] initWithDictionary:self.dictionary[@"entities"]];
    }
    return _entities;
}

- (TWExtendedEntities *)extended_entities
{
    if (!_extended_entities) {
        _extended_entities = [[TWExtendedEntities alloc] initWithDictionary:self.dictionary[@"extended_entities"]];
    }
    return _extended_entities;
}

- (NSUInteger)favorite_count
{
    return [self.dictionary[@"favorite_count"] unsignedIntegerValue];
}

- (BOOL)favorited
{
    return [self.dictionary[@"favorited"] boolValue];
}

- (NSUInteger)retweet_count
{
    return [self.dictionary[@"retweet_count"] unsignedIntegerValue];
}

- (BOOL)retweeted
{
    return [self.dictionary[@"retweeted"] boolValue];
}

- (TWTweet *)retweeted_status
{
    if (!_retweeted_status) {
        _retweeted_status = [[TWTweet alloc] initWithDictionary:self.dictionary[@"retweeted_status"]];
    }
    return _retweeted_status;
}

- (int64_t)in_reply_to_status_id
{
    return [self.dictionary[@"in_reply_to_status_id"] longLongValue];
}

- (NSString *)in_reply_to_status_id_str
{
    return self.dictionary[@"in_reply_to_status_id_str"];
}

- (NSString *)in_reply_to_screen_name
{
    return self.dictionary[@"in_reply_to_screen_name"];
}

- (int64_t)in_reply_to_user_id
{
    return [self.dictionary[@"in_reply_to_user_id"] longLongValue];
}

- (NSString *)in_reply_to_user_id_str
{
    return self.dictionary[@"in_reply_to_user_id_str"];
}

- (BOOL)is_quote_status
{
    return [self.dictionary[@"is_quote_status"] boolValue];
}

- (NSString *)lang
{
    return self.dictionary[@"lang"];
}

- (TWCurrentUserRetweet *)current_user_retweet
{
    return [[TWCurrentUserRetweet alloc] initWithDictionary:self.dictionary[@"current_user_retweet"]];
}

- (NSString *)filter_level
{
    return self.dictionary[@"filter_level"];
}

- (TWPlace *)place
{
    return [[TWPlace alloc] initWithDictionary:self.dictionary[@"place"]];
}

- (BOOL)possibly_sensitive
{
    return [self.dictionary[@"possibly_sensitive"] boolValue];
}

- (NSString *)source
{
    return self.dictionary[@"source"];
}

- (BOOL)truncated
{
    return [self.dictionary[@"truncated"] boolValue];;
}

- (BOOL)withheld_copyright
{
    return [self.dictionary[@"withheld_copyright"] boolValue];
}

- (NSArray *)withheld_in_countries
{
    return self.dictionary[@"withheld_in_countries"];
}

- (NSString *)withheld_scope
{
    return self.dictionary[@"withheld_scope"];
}

- (id)annotations
{
    return self.dictionary[@"annotations"];
}

- (NSArray *)contributors
{
    return self.dictionary[@"contributors"];
}

- (NSArray *)contributorObjects
{
    if (!_contributorObjects) {
        NSArray *contributors = [self contributors];
        _contributorObjects = [contributors tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWContributor alloc] initWithDictionary:obj];
        }];
    }
    return _contributorObjects;
}

- (TWCoordinates *)coordinates
{
    return [[TWCoordinates alloc] initWithDictionary:self.dictionary[@"coordinates"]];
}

- (TWScopes *)scopes
{
    return [[TWScopes alloc] initWithDictionary:self.dictionary[@"scopes"]];
}

@end

@implementation TWContributor

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}

- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

- (NSString *)screen_name
{
    return self.dictionary[@"screen_name"];
}

@end

@implementation TWCoordinates

- (NSArray *)coordinates
{
    return self.dictionary[@"coordinates"];
}

- (NSString *)type
{
    return self.dictionary[@"type"];
}

@end

@implementation TWCurrentUserRetweet

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}

- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

@end

@implementation TWPlace

- (NSString *)id
{
    return self.dictionary[@"id"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)full_name
{
    return self.dictionary[@"full_name"];
}

- (NSString *)place_type
{
    return self.dictionary[@"place_type"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

- (NSString *)country
{
    return self.dictionary[@"country"];
}

- (NSString *)country_code
{
    return self.dictionary[@"country_code"];
}

- (TWPlaceAttributes *)attributes
{
    return [[TWPlaceAttributes alloc] initWithDictionary:self.dictionary[@"attributes"]];
}

- (TWPlaceBoundingBox *)bounding_box
{
    return [[TWPlaceBoundingBox alloc] initWithDictionary:self.dictionary[@"bounding_box"]];
}

@end

@implementation TWPlaceAttributes

- (id)street_address
{
    return self.dictionary[@"street_address"];
}

- (id)locality
{
    return self.dictionary[@"locality"];
}

- (id)region
{
    return self.dictionary[@"region"];
}

- (id)iso3
{
    return self.dictionary[@"iso3"];
}

- (id)postal_code
{
    return self.dictionary[@"postal_code"];
}

- (id)phone
{
    return self.dictionary[@"phone"];
}

- (NSString *)twitter
{
    return self.dictionary[@"twitter"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

- (NSString *)appID
{
    for (NSString *key in self.dictionary.allKeys) {
        if ([key hasSuffix:@":id"]) {
            return self.dictionary[key];
        }
    }
    return nil;
}

@end

@implementation TWPlaceBoundingBox

- (NSArray *)coordinates
{
    return self.dictionary[@"coordinates"];
}

- (NSString *)type
{
    return self.dictionary[@"type"];
}

@end

@implementation TWScopes : TWObject

- (BOOL)followers
{
    return [self.dictionary[@"followers"] boolValue];
}

@end
