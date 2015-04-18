//
//  TWProfileBanner.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWProfileBannerSize;

/**
 *  GET users/profile_banner
 *  https://dev.twitter.com/rest/reference/get/users/profile_banner
 *
 *  Profile Banners
 *  https://dev.twitter.com/overview/general/user-profile-images-and-banners
 */
typedef NS_ENUM(NSInteger, TWProfileBannerSizeType) {
    TWProfileBannerSizeTypeIPad,
    TWProfileBannerSizeTypeIPadRetina,
    TWProfileBannerSizeTypeWeb,
    TWProfileBannerSizeTypeWebRetina,
    TWProfileBannerSizeTypeMobile,
    TWProfileBannerSizeTypeMobileRetina,
    TWProfileBannerSizeType300x100,
    TWProfileBannerSizeType600x200,
    TWProfileBannerSizeType1500x500,
};

@interface TWProfileBanner : TWObject

- (NSDictionary *)sizes;

- (TWProfileBannerSize *)sizeForType:(TWProfileBannerSizeType)type;

@end

@interface TWProfileBannerSize : TWObject

- (NSUInteger)h;
- (NSUInteger)w;
- (NSString *)url;

@end