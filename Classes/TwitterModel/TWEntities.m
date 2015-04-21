//
//  TWEntities.m
//
//  Created by Yu Sugawara on 4/17/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWEntities.h"

@implementation TWEntities
{
    NSArray *_hashtagObjects;
    NSArray *_mediaObjects;
    NSArray *_urlObjects;
    NSArray *_user_entionObjects;
}

- (NSArray *)hashtags
{
    return self.dictionary[@"hashtags"];
}

- (NSArray *)hashtagObjects
{
    if (!_hashtagObjects) {
        _hashtagObjects = [[self hashtags] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWHashtag alloc] initWithDictionary:obj];
        }];
    }
    return _hashtagObjects;
}

- (NSArray *)media
{
    return self.dictionary[@"media"];
}

- (NSArray *)mediaObjects
{
    if (!_mediaObjects) {
        _mediaObjects = [[self media] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWMedia alloc] initWithDictionary:obj];
        }];
    }
    return _mediaObjects;
}

- (NSArray *)urls
{
    return self.dictionary[@"urls"];
}

- (NSArray *)urlObjects
{
    if (!_urlObjects) {
        _urlObjects = [[self urls] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWURL alloc] initWithDictionary:obj];
        }];
    }
    return _urlObjects;
}

- (NSArray *)user_mentions
{
    return self.dictionary[@"user_mentions"];
}

- (NSArray *)user_mentionObjects
{
    if (!_user_entionObjects) {
        _user_entionObjects = [[self user_mentions] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWUserMention alloc] initWithDictionary:obj];
        }];
    }
    return _user_entionObjects;
}

@end

@implementation TWEntitiy

- (NSArray *)indices
{
    return self.dictionary[@"indices"];
}

@end

@implementation TWHashtag

- (NSString *)text
{
    return self.dictionary[@"text"];
}

@end

@implementation TWURL

- (NSString *)display_url
{
    return self.dictionary[@"display_url"];
}

- (NSString *)expanded_url
{
    return self.dictionary[@"expanded_url"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

@end

@implementation TWMedia

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}
- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

- (int64_t)source_status_id
{
    return [self.dictionary[@"source_status_id"] longLongValue];
}

- (NSString *)source_status_id_str
{
    return self.dictionary[@"source_status_id_str"];
}

- (NSString *)media_url
{
    return self.dictionary[@"media_url"];
}

- (NSString *)media_url_https
{
    return self.dictionary[@"media_url_https"];
}

- (NSString *)type
{
    return self.dictionary[@"type"];
}

- (NSDictionary *)sizes
{
    return self.dictionary[@"sizes"];
}

- (TWMediaSize *)sizeForType:(TWMediaSizeType)type
{
    NSDictionary *sizes = [self sizes];
    NSString *sizeType;
    switch (type) {
        case TWMediaSizeTypeThumb:
            sizeType = @"thumb";
            break;
        case TWMediaSizeTypeSmall:
            sizeType = @"small";
            break;
        case TWMediaSizeTypeMedium:
            sizeType = @"medium";
            break;
        default:
            NSLog(@"%s; Unknown size type = %zd", __func__, type);
        case TWMediaSizeTypeLarge:
            sizeType = @"large";
            break;
    }
    return [[TWMediaSize alloc] initWithDictionary:sizes[sizeType]];
}

@end

@implementation TWMediaSize

- (NSUInteger)w
{
    return [self.dictionary[@"w"] unsignedIntegerValue];
}

- (NSUInteger)h
{
    return [self.dictionary[@"h"] unsignedIntegerValue];
}

- (NSString *)resize
{
    return self.dictionary[@"resize"];
}

@end

@implementation TWUserMention

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}

- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)screen_name
{
    return self.dictionary[@"screen_name"];
}

@end
