//
//  TWEntities.h
//
//  Created by Yu Sugawara on 4/17/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWHashtag, TWMedia, TWURL, TWUserMention;

/**
 *  Entities
 *  https://dev.twitter.com/overview/api/entities
 */
@interface TWEntities : TWObject

- (NSArray<NSDictionary *> *)hashtags;
- (NSArray<TWHashtag *> *)hashtagObjects;
- (NSArray<NSDictionary *> *)media;
- (NSArray<TWMedia *> *)mediaObjects;
- (NSArray<NSDictionary *> *)urls;
- (NSArray<TWURL *> *)urlObjects;
- (NSArray<NSDictionary *> *)user_mentions;
- (NSArray<TWUserMention *> *)user_mentionObjects;

@end

/**
 *  extended_entities
 *  https://dev.twitter.com/overview/api/entities-in-twitter-objects#extended_entities
 */
@interface TWExtendedEntities : TWObject

- (NSArray<NSDictionary *> *)media;
- (NSArray<TWMedia *> *)mediaObjects;

@end

@interface TWEntitiy : TWObject

- (NSArray *)indices;       // Array of Int

@end

/**
 *  Hashtags
 *  https://dev.twitter.com/overview/api/entities#obj-hashtags
 */
@interface TWHashtag : TWEntitiy

- (NSString *)text;

@end

/**
 *  URL
 *  https://dev.twitter.com/overview/api/entities#obj-url
 */
@interface TWURL : TWEntitiy

- (NSString *)display_url;      // e.g. "youtube.com/watch?v=oHg5SJ\u2026"
- (NSString *)expanded_url;     // e.g. "http://www.youtube.com/watch?v=oHg5SJYRHA0"
- (NSString *)url;              // e.g. "http://t.co/IOwBrTZR"

@end

/**
 *  Media
 *  https://dev.twitter.com/overview/api/entities#obj-media
 *
 *  Sizes
 *  https://dev.twitter.com/overview/api/entities#obj-sizes
 */
@class TWMediaSize;
typedef NS_ENUM(NSInteger, TWMediaSizeType) {
    TWMediaSizeTypeThumb,
    TWMediaSizeTypeSmall,
    TWMediaSizeTypeMedium,
    TWMediaSizeTypeLarge,
};

@interface TWMedia : TWURL

- (int64_t)id;
- (NSString *)id_str;
- (int64_t)source_status_id;
- (NSString *)source_status_id_str;
- (NSString *)media_url;        // e.g. "http://p.twimg.com/AZVLmp-CIAAbkyy.jpg"
- (NSString *)media_url_https;  // e.g. "https://p.twimg.com/AZVLmp-CIAAbkyy.jpg"
- (NSString *)type;             // e.g. "photo"
- (NSDictionary *)sizes;
- (TWMediaSize *)sizeForType:(TWMediaSizeType)type;

@end

/**
 *  Size
 *  https://dev.twitter.com/overview/api/entities#obj-size
 */
@interface TWMediaSize : TWObject

- (NSUInteger)w;
- (NSUInteger)h;
- (NSString *)resize;

@end

/**
 *  User Mention
 *  https://dev.twitter.com/overview/api/entities#obj-usermention
 */
@interface TWUserMention : TWEntitiy

- (int64_t)id;
- (NSString *)id_str;
- (NSString *)name;
- (NSString *)screen_name;

@end
