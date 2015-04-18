//
//  TWGeo.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWGeoQuery, TWGeoResult;

/**
 *  GET geo/search
 *  https://dev.twitter.com/rest/reference/get/geo/search etc...
 */
@interface TWGeo : TWObject

- (TWGeoQuery *)query;
- (TWGeoResult *)result;

@end

@interface TWGeoQuery : TWObject

- (NSDictionary *)params;
- (NSString *)type;
- (NSString *)url;

@end

@interface TWGeoResult : TWObject

- (NSArray *)places;

@end