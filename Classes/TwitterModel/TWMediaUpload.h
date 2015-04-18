//
//  TWMediaUpload.h
//
//  Created by Yu Sugawara on 4/14/15.
//  Copyright (c) 2015 Yu Sugawara. All rights reserved.
//

#import "TWObject.h"
@class TWMediaUploadImage;

/**
 *  POST media/upload
 *  https://dev.twitter.com/rest/reference/post/media/upload
 *
 *
 *  {
 *      "media_id": 553639437322563584,
 *      "media_id_string": "553639437322563584",
 *      "size": 998865,
 *      "image": {
 *          "w": 2234,
 *          "h": 1873,
 *          "image_type": "image/jpeg"
 *      }
 *  }
 */

@interface TWMediaUpload : TWObject

- (int64_t)media_id;
- (NSString *)media_id_string;
- (NSUInteger)size;
- (TWMediaUploadImage *)image;

@end

@interface TWMediaUploadImage : TWObject

- (NSUInteger)w;
- (NSUInteger)h;
- (NSString *)image_type;       // e.g. "image/jpeg"

@end