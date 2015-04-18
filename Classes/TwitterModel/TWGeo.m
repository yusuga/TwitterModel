//
//  TWGeo.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWGeo.h"

@implementation TWGeo

- (TWGeoQuery *)query
{
    return [[TWGeoQuery alloc] initWithDictionary:self.dictionary[@"query"]];
}

- (TWGeoResult *)result
{
    return [[TWGeoResult alloc] initWithDictionary:self.dictionary[@"result"]];
}

@end

@implementation TWGeoQuery

- (NSDictionary *)params
{
    return self.dictionary[@"params"];
}

- (NSString *)type
{
    return self.dictionary[@"type"];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

@end

@implementation TWGeoResult

- (NSArray *)places
{
    return self.dictionary[@"places"];
}

@end