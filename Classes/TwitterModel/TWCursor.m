//
//  TWCursor.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWCursor.h"
#import "TWUser.h"
#import "TWList.h"

@implementation TWCursor

- (int64_t)previous_cursor
{
    return [self.dictionary[@"previous_cursor"] longLongValue];
}

- (NSString *)previous_cursor_str
{
    return self.dictionary[@"previous_cursor_str"];
}

- (int64_t)next_cursor
{
    return [self.dictionary[@"next_cursor"] longLongValue];
}

- (NSString *)next_cursor_str
{
    return self.dictionary[@"next_cursor_str"];
}

@end

@implementation TWIdentifiers

- (NSArray *)ids
{
    return self.dictionary[@"ids"];
}

@end

@implementation TWUsers
{
    NSArray *_users;
}

- (NSArray *)users
{
    if (!_users) {
        _users = [self.dictionary[@"users"] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWUser alloc] initWithDictionary:obj];
        }];
    }
    return _users;
}

@end

@implementation TWLists
{
    NSArray *_lists;
}

- (NSArray *)lists
{
    if (!_lists) {
        _lists = [self.dictionary[@"lists"] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWList alloc] initWithDictionary:obj];
        }];
    }
    return _lists;
}

@end
