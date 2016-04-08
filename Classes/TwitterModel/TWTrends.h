//
//  TWTrends.h
//  TwitterModelExample
//
//  Created by Yu Sugawara on 2016/04/07.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWTrendsPlaceType, TWTrend;

typedef NS_ENUM(NSUInteger, TWTrendsPlaceTypeCode) {
    TWTrendsPlaceTypeCodeTown = 7,
    TWTrendsPlaceTypeCodeUnknown9 = 9,
    TWTrendsPlaceTypeCodeCountry = 12,
    TWTrendsPlaceTypeCodeSupername = 19,
    TWTrendsPlaceTypeCodeUnknown22 = 22,
};

@interface TWTrendsLocation : TWObject

+ (NSArray<TWTrendsLocation *> *)locationsWithTrendsAvailableValue:(NSArray *)trendsAvailableValue;

- (NSString *)country;                          // e.g. Japan
- (NSString *)countryCode;                      // e.g. JP
- (NSString *)name;                             // e.g. Tokyo
- (NSNumber *)parentid;                         // e.g. 23424856
- (TWTrendsPlaceType *)placeType;
- (NSString *)url;                              // e.g. http://where.yahooapis.com/v1/place/1118370
- (NSNumber *)woeid;                            // e.g. 1118370

@end

@interface TWTrendsPlaceType : TWObject

- (NSNumber *)code;                              // e.g. 7
- (NSString *)name;                              // e.g. Town

@end

@interface TWTrendsPlace : TWObject

+ (NSArray<TWTrendsPlace *> *)placesWithTrendsPlaceValue:(NSArray *)trendsPlaceValue;

- (NSString *)as_of;                             // e.g. 2016-04-07T13:09:58Z
- (NSString *)created_at;                        // e.g. 2016-04-07T13:02:17Z
- (NSArray<TWTrendsLocation *> *)locations;      // e.g. [{"name":"Japan", "woeid":23424856}]
- (NSArray<TWTrend *> *)trends;

- (NSDate *)asOfDateUTC;
- (NSDate *)asOfDateSystemTimeZone;
- (NSDate *)createdAtDateUTC;
- (NSDate *)createdAtDateSystemTimeZone;

@end

@interface TWTrend : TWObject

- (NSString *)name;                              // e.g. 完全感覚Dreamer
- (NSString *)query;                             // e.g. %E5%AE%8C%E5%85%A8%E6%84%9F%E8%A6%9ADreamer
- (NSNumber *)tweet_volume;                      // e.g. 12345
- (NSString *)url;                               // e.g. http://twitter.com/search?q=%E5%AE%8C%E5%85%A8%E6%84%9F%E8%A6%9ADreamer

- (id)events;
- (id)promoted_content;

@end
