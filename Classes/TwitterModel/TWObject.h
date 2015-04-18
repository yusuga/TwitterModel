//
//  TWObject.h
//
//  Created by Yu Sugawara on 4/11/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface TWObject : NSObject <NSCoding, NSCopying>

- (TWObject * __nullable)initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic, readonly) NSDictionary *dictionary;

@end

@interface NSArray (TWObject)

- (NSArray *)tw_mappedArrayWithBlock:(id __nullable(^)(id obj))block;

@end
NS_ASSUME_NONNULL_END