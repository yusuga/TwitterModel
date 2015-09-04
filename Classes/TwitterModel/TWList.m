//
//  TWList.m
//
//  Created by Yu Sugawara on 4/18/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWList.h"
#import "TWUser.h"

@implementation TWList
{
    TWUser *_user;
}

- (int64_t)id
{
    return [self.dictionary[@"id"] longLongValue];
}
- (NSString *)id_str
{
    return self.dictionary[@"id_str"];
}

- (NSString *)slug
{
    return self.dictionary[@"slug"];
}

- (NSString *)created_at
{
    return self.dictionary[@"created_at"];
}

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)full_name
{
    return self.dictionary[@"full_name"];
}

- (NSString *)description
{
    return self.dictionary[@"description"];
}

- (TWUser *)user
{
    if (!_user) {
        _user = [[TWUser alloc] initWithDictionary:self.dictionary[@"user"]];
    }
    return _user;
}

- (NSString *)mode
{
    return self.dictionary[@"mode"];
}

- (NSString *)uri
{
    return self.dictionary[@"uri"];
}

- (BOOL)following
{
    return [self.dictionary[@"following"] boolValue];
}

- (NSUInteger)member_count
{
    return [self.dictionary[@"member_count"] unsignedIntegerValue];
}

- (NSUInteger)subscriber_count
{
    return [self.dictionary[@"subscriber_count"] unsignedIntegerValue];
}

#pragma mark -

- (BOOL)isPrivate
{
    return [self.mode isEqualToString:@"private"];
}

@end
