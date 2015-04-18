//
//  TWSuggestion.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWSuggestion.h"

@implementation TWSuggestion

- (NSString *)name
{
    return self.dictionary[@"name"];
}

- (NSString *)slug
{
    return self.dictionary[@"slug"];
}

- (NSInteger)size
{
    return [self.dictionary[@"size"] integerValue];
}

@end

@implementation TWSuggestedUsers

- (NSArray *)users
{
    return self.dictionary[@"users"];
}

@end