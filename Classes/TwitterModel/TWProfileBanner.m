//
//  TWProfileBanner.m
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWProfileBanner.h"

@implementation TWProfileBanner

- (NSDictionary *)sizes
{
    return self.dictionary[@"sizes"];
}

#pragma mark -

- (TWProfileBannerSize *)sizeForType:(TWProfileBannerSizeType)type
{
    NSString *key;
    switch (type) {
        case TWProfileBannerSizeTypeIPad:
            key = @"ipad";
            break;
        case TWProfileBannerSizeTypeIPadRetina:
            key = @"ipad_retina";
            break;
        case TWProfileBannerSizeTypeWeb:
            key = @"web";
            break;
        case TWProfileBannerSizeTypeWebRetina:
            key = @"web_retina";
            break;
        case TWProfileBannerSizeTypeMobile:
            key = @"mobile";
            break;
        case TWProfileBannerSizeTypeMobileRetina:
            key = @"mobile_retina";
            break;
        case TWProfileBannerSizeType300x100:
            key = @"300x100";
            break;
        case TWProfileBannerSizeType600x200:
            key = @"600x200";
            break;
        case TWProfileBannerSizeType1500x500:
            key = @"1500x500";
            break;
        default:
            break;
    }
    
    return [[TWProfileBannerSize alloc] initWithDictionary:self.dictionary[key]];
}

@end

@implementation TWProfileBannerSize

- (NSUInteger)h
{
    return [self.dictionary[@"h"] unsignedIntegerValue];
}

- (NSUInteger)w
{
    return [self.dictionary[@"w"] unsignedIntegerValue];
}

- (NSString *)url
{
    return self.dictionary[@"url"];
}

@end
