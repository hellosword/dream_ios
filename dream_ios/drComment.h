//
//  drComment.h
//  dream_ios
//
//  Created by hellosword on 14-5-13.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "drUser.h"
@interface drComment : NSObject
/*
 
 commentId: 11
 content: "这是一条回复"
 postTime: "2014-04-19 16:37"
 replyNum: 0
 
 */
@property(nonatomic, assign) NSNumber* commentId;
@property(nonatomic, strong) NSString* content;
@property(nonatomic, strong) NSString* postTime;
@property(nonatomic, assign) NSNumber* replyNum;

@property(nonatomic, assign) NSNumber* eventId;


@property(nonatomic, strong) drUser* publisher;

@end
