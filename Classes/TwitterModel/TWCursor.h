//
//  TWCursor.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"

@interface TWCursor : TWObject

- (int64_t)previous_cursor;
- (NSString *)previous_cursor_str;
- (int64_t)next_cursor;
- (NSString *)next_cursor_str;

@end

/**
 *  GET friends/ids
 *  https://dev.twitter.com/rest/reference/get/friends/ids etc...
 *
 *  {
 *      "previous_cursor": 0,
 *      "previous_cursor_str": "0",
 *      "next_cursor": 0,
 *      "next_cursor_str": "0"
 *      "ids": [
 *          657693,
 *          183709371,
 *          7588892
 *      ]
 *  }
 */
@interface TWIdentifiers : TWCursor

- (NSArray *)ids;

@end

/**
 *  GET friends/list
 *  https://dev.twitter.com/rest/reference/get/friends/list etc...
 *
 *  {
 *      "previous_cursor": 0,
 *      "previous_cursor_str": "0",
 *      "next_cursor": 1333504313713126852,
 *      "next_cursor_str": "1333504313713126852"
 *      "users": [
 *              { <user> },
 *              { <user> },
 *              { <user> }
 *      ]
 *  }
 */
@interface TWUsers : TWCursor

- (NSArray *)users;     // Array of TWUser

@end

/**
 *  GET lists/ownerships
 *  https://dev.twitter.com/rest/reference/get/lists/ownerships etc...
 *  {
 *      "previous_cursor": 0,
 *      "previous_cursor_str": "0",
 *      "next_cursor": 1333504313713126852,
 *      "next_cursor_str": "1333504313713126852"
 *      "lists": [
 *              { <list> },
 *              { <list> },
 *              { <list> }
 *      ]
 *  }
 */
@interface TWLists : TWCursor

- (NSArray *)lists;     // Array of TWList

@end