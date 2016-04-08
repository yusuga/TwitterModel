//
//  TWTrends.m
//  TwitterModelExample
//
//  Created by Yu Sugawara on 2016/04/07.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "TWTrends.h"

@implementation TWTrendsLocation

+ (NSArray<TWTrendsLocation *> *)locationsWithTrendsAvailableValue:(NSArray *)trendsAvailableValue
{
    return [trendsAvailableValue tw_mappedArrayWithBlock:^id _Nullable(id  _Nonnull obj) {
        return [[TWTrendsLocation alloc] initWithDictionary:obj];
    }];
}

- (NSString *)country
{
    return self.dictionary[@"country"];
}

- (NSString *)countryCode
{
    return self.dictionary[@"countryCode"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSNumber *)parentid
{
    return self.dictionary[@"parentid"];
}

- (TWTrendsPlaceType *)placeType
{
    return [[TWTrendsPlaceType alloc] initWithDictionary:self.dictionary[@"placeType"]];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

- (NSNumber *)woeid
{
    return self.dictionary[@"woeid"];
}

@end

@implementation TWTrendsPlaceType

- (NSNumber *)code
{
    return self.dictionary[@"code"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

@end

@implementation TWTrendsPlace
{
    NSArray<TWTrendsLocation *> *_locationObjects;
    NSArray<TWTrend *> *_trendObjects;
}

+ (NSArray<TWTrendsPlace *> *)placesWithTrendsPlaceValue:(NSArray *)trendsPlaceValue
{
    return [trendsPlaceValue tw_mappedArrayWithBlock:^id _Nullable(id  _Nonnull obj) {
        return [[TWTrendsPlace alloc] initWithDictionary:obj];
    }];
}

- (NSString *)as_of
{
    return self.dictionary[@"as_of"];
}

- (NSString *)created_at
{
    return self.dictionary[@"created_at"];
}

- (NSArray<TWTrendsLocation *> *)locations
{
    if (!_locationObjects) {
        _locationObjects = [self.dictionary[@"locations"] tw_mappedArrayWithBlock:^id _Nullable(id  _Nonnull obj) {
            return [[TWTrendsLocation alloc] initWithDictionary:obj];
        }];
    }
    return _locationObjects;
}

- (NSArray<TWTrend *> *)trends
{
    if (!_trendObjects) {
        _trendObjects = [self.dictionary[@"trends"] tw_mappedArrayWithBlock:^id _Nullable(id  _Nonnull obj) {
            return [[TWTrend alloc] initWithDictionary:obj];
        }];
    }
    return _trendObjects;
}

- (NSDate *)asOfDateUTC
{
    return [[[self class] UTCFormatter] dateFromString:[self as_of]];
}

- (NSDate *)asOfDateSystemTimeZone
{
    return [self systemTimeZoneDateFromUTCDate:[self asOfDateUTC]];
}

- (NSDate *)createdAtDateUTC
{
    return [[[self class] UTCFormatter] dateFromString:[self created_at]];
}

- (NSDate *)createdAtDateSystemTimeZone
{
    return [self systemTimeZoneDateFromUTCDate:[self createdAtDateUTC]];
}

+ (NSDateFormatter *)UTCFormatter
{
    static NSDateFormatter *__formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __formatter = [[NSDateFormatter alloc] init];
        __formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
        __formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    });
    return __formatter;
}

- (NSDate *)systemTimeZoneDateFromUTCDate:(NSDate *)UTCDate
{
    /*
     *  Convert UTC NSDate to local Timezone Objective-C
     *  http://stackoverflow.com/a/7739612
     *
     *  localTimeZone, systemTimeZone, defaultTimeZoneの違い
     *  http://anton0825.hatenablog.com/entry/20130505/1371483153
     */
    NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];
    NSInteger seconds = [systemTimeZone secondsFromGMTForDate:UTCDate];
    return [NSDate dateWithTimeInterval:seconds sinceDate:UTCDate];
}

@end

@implementation TWTrend

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)query
{
    return self.dictionary[@"query"];
}

- (NSNumber *)tweet_volume
{
    return self.dictionary[@"tweet_volume"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

- (id)events
{
    return self.dictionary[@"events"];
}

- (id)promoted_content
{
    return self.dictionary[@"promoted_content"];
}


@end
