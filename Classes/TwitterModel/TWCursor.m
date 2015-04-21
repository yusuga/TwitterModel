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
    NSArray *_userObjects;
}

- (NSArray *)users
{
    return self.dictionary[@"users"];
}

- (NSArray *)userObjects
{
    if (!_userObjects) {
        _userObjects = [[self users] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWUser alloc] initWithDictionary:obj];
        }];
    }
    return _userObjects;
}

@end

@implementation TWLists
{
    NSArray *_listObjects;
}

- (NSArray *)lists
{
    return self.dictionary[@"lists"];
}

- (NSArray *)listObjects
{
    if (!_listObjects) {
        _listObjects = [[self lists] tw_mappedArrayWithBlock:^id(id __nonnull obj) {
            return [[TWList alloc] initWithDictionary:obj];
        }];
    }
    return _listObjects;
}

@end
