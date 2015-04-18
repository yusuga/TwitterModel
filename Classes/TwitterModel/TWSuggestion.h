//
//  TWSuggestion.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"

@interface TWSuggestion : TWObject

- (NSString *)name;
- (NSString *)slug;
- (NSInteger)size;

@end

/**
 *  GET users/suggestions/:slug
 *  https://dev.twitter.com/rest/reference/get/users/suggestions/%3Aslug
 */
@interface TWSuggestedUsers : TWSuggestion

- (NSArray *)users;

@end