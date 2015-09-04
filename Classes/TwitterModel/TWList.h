//
//  TWList.h
//
//  Created by Yu Sugawara on 4/18/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWUser;

@interface TWList : TWObject

- (int64_t)id;                  // e.g. 574
- (NSString *)id_str;           // e.g. "574"
- (NSString *)slug;             // e.g. "team"
- (NSString *)created_at;       // e.g. "Wed Sep 23 01:18:01 +0000 2009"
- (NSString *)name;             // e.g. "Team"
- (NSString *)full_name;        // e.g. "@twitter/team"
- (NSString *)description;
- (TWUser *)user;
- (NSString *)mode;             // e.g. "public"
- (NSString *)uri;              // e.g. "/twitter/team"
- (BOOL)following;              // e.g. false,
- (NSUInteger)member_count;     // e.g. 643
- (NSUInteger)subscriber_count; // e.g. 76779

- (BOOL)isPrivate;

@end
