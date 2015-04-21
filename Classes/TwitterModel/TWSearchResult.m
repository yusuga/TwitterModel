//
//  TWSearchResult.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWSearchResult.h"
#import "TWTweet.h"

@implementation TWSearchResult
{
    TWSearchMetadata *_search_metadata;
    NSArray *_statuseObjects;
}
- (TWSearchMetadata *)search_metadata
{
    if (!_search_metadata) {
        _search_metadata = [[TWSearchMetadata alloc] initWithDictionary:self.dictionary[@"search_metadata"]];
    }
    return _search_metadata;
}

- (NSArray *)statuses
{
    return self.dictionary[@"statuses"];
}

- (NSArray *)statuseObjects
{
    if (!_statuseObjects) {
        _statuseObjects = [[self statuses] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWTweet alloc] initWithDictionary:obj];
        }];
    }
    return _statuseObjects;
}

@end

@implementation TWSearchMetadata

- (NSString *)query
{
    return self.dictionary[@"query"];
}

- (int64_t)max_id
{
    return [self.dictionary[@"max_id"] longLongValue];
}
- (NSString *)max_id_str
{
    return self.dictionary[@"max_id_str"];
}

- (int64_t)since_id
{
    return [self.dictionary[@"since_id"] longLongValue];
}

- (NSString *)since_id_str
{
    return self.dictionary[@"since_id_str"];
}

- (NSUInteger)count
{
    return [self.dictionary[@"count"] unsignedIntegerValue];
}

- (NSString *)refresh_url
{
    return self.dictionary[@"refresh_url"];
}

- (NSString *)next_results
{
    return self.dictionary[@"next_results"];
}

- (CGFloat)completed_in
{
    return [self.dictionary[@"completed_in"] floatValue];
}

- (int64_t)nextMaxID
{
    NSString *results = [self next_results];
    
    /**
     *  "?max_id=249279667666817023&q=%23freebandnames&count=4&include_entities=1&result_type=mixed"
     */
    NSString *key = @"max_id=";
    NSScanner *scanner = [NSScanner scannerWithString:results];
    [scanner scanUpToString:key intoString:NULL];
    [scanner scanString:key intoString:NULL];
    NSString *maxID;
    [scanner scanUpToString:@"&" intoString:&maxID];
    
    return [maxID longLongValue];
}

- (BOOL)isAllGot
{
    return [self next_results] == nil;
}

@end