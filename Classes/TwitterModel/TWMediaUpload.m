//
//  TWMediaUpload.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWMediaUpload.h"

@implementation TWMediaUpload

- (int64_t)media_id
{
    return [self.dictionary[@"media_id"] longLongValue];
}

- (NSString *)media_id_string
{
    return self.dictionary[@"media_id_string"];
}

- (NSUInteger)size
{
    return [self.dictionary[@"size"] integerValue];
}

- (TWMediaUploadImage *)image
{
    return [[TWMediaUploadImage alloc] initWithDictionary:self.dictionary[@"image"]];
}

@end

@implementation TWMediaUploadImage

- (NSUInteger)w
{
    return [self.dictionary[@"w"] unsignedIntegerValue];
}

- (NSUInteger)h
{
    return [self.dictionary[@"h"] unsignedIntegerValue];
}

- (NSString *)image_type
{
    return self.dictionary[@"image_type"];
}

@end