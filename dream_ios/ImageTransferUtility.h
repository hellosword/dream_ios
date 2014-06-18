//
//  ImageTransferUtility.h
//  dream_ios
//
//  Created by hellosword on 14-6-14.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ImageTransferDelegate.h"
#import "NSString+URLEncoding.h"
@interface ImageTransferUtility : NSObject

@property (strong) ASINetworkQueue* networkQueue;

@property (weak, nonatomic) id <ImageTransferDelegate> delegate;

-(void) startImageListQuery:(NSMutableArray *)urllist;

@end
