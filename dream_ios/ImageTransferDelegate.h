//
//  ImageTransferDelegate.h
//  dream_ios
//
//  Created by hellosword on 14-6-15.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//
@protocol ImageTransferDelegate

@optional

- (void)getImageListItemFinished:(NSData *)data imgIndex:(int)index;
- (void)getImageListItemFailed:(NSError *)error imgIndex:(int)index;
- (void)getImageListFinished:(int)cnt;

@end
