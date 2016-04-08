//
//  TwitterModelExampleTests.m
//  TwitterModelExampleTests
//
//  Created by Yu Sugawara on 4/17/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TwitterModel.h"

@interface TwitterModelExampleTests : XCTestCase

@end

@implementation TwitterModelExampleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTweet
{
    TWTweet *tweet = [[TWTweet alloc] initWithDictionary:[self jsonObjectForResource:@"tweet"]];
    
    XCTAssertGreaterThan(tweet.id, 0);
    XCTAssertEqual(tweet.id, tweet.id_str.longLongValue);
    XCTAssertGreaterThan(tweet.text.length, 0);
    
    TWUser *user = tweet.user;
    XCTAssertTrue([user isKindOfClass:[TWUser class]]);
    XCTAssertGreaterThan(user.id, 0);
    XCTAssertEqual(user.id, user.id_str.longLongValue);
    
    TWUserEntities *userEntities = user.entities;
    XCTAssertTrue([userEntities.url isKindOfClass:[TWEntities class]]);
    
    TWEntities *entities = tweet.entities;
    XCTAssertTrue([entities isKindOfClass:[TWEntities class]]);
    XCTAssertTrue([entities.hashtagObjects isKindOfClass:[NSArray class]]);
    
    TWHashtag *hashtag = [entities.hashtagObjects firstObject];
    XCTAssertTrue([hashtag isKindOfClass:[TWHashtag class]]);
    XCTAssertGreaterThan(hashtag.text.length, 0);
}

- (void)testTrendsPlaceDate
{
    TWTrendsPlace *place = [[TWTrendsPlace placesWithTrendsPlaceValue:[self jsonObjectForResource:@"trends_place"]] firstObject];
    XCTAssertNotNil(place);
    
    XCTAssertNotNil(place.asOfDateUTC);
    NSLog(@"asOfDate: %@, %@", place.asOfDateUTC, place.asOfDateSystemTimeZone);
    XCTAssertNotNil(place.createdAtDateUTC);
    NSLog(@"createdAtDate: %@, %@", place.createdAtDateUTC, place.createdAtDateSystemTimeZone);
}

#pragma mark - Utility

- (id)jsonObjectForResource:(NSString *)resource
{
    NSError *error = nil;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:resource ofType:@"json"]]
                                                 options:0
                                                   error:&error];
    XCTAssertNil(error, @"resource = %@, error = %@", resource, error);
    return jsonObj;
}

@end
