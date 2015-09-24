//
//  TWObject.m
//
//  Created by Yu Sugawara on 4/11/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"

NS_ASSUME_NONNULL_BEGIN
@implementation TWObject

- (TWObject * __nullable)initWithDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (self = [super init]) {
        if ([dictionary isKindOfClass:[NSDictionary class]]) {
            _dictionary = dictionary;
        }
    }
    return self;
}

#pragma mark - NSCoding

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _dictionary = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(dictionary))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.dictionary
                  forKey:NSStringFromSelector(@selector(dictionary))];
}

#pragma mark - NSCopying

- (nonnull instancetype)copyWithZone:(nullable NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithDictionary:self.dictionary];
}

@end

@implementation NSArray (TWObject)

- (NSArray *)tw_mappedArrayWithBlock:(id __nullable(^)(id obj))block
{
    NSParameterAssert(block);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    for (id obj in self) {
        id mappedObj = block(obj);
        if (mappedObj) {
            [array addObject:mappedObj];
        }
    }
    return [NSArray arrayWithArray:array];
}

@end

NS_ASSUME_NONNULL_END