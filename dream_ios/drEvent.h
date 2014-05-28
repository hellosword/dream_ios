//
//  drEvent.h
//  dream_ios
//
//  Created by hellosword on 14-4-23.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "drUser.h"
@interface drEvent : NSObject

@property(nonatomic, strong) NSDate* activityTime;
@property(nonatomic, strong) NSString* activityLocation;
@property(nonatomic, strong) NSString* user_avatar;
@property(nonatomic, strong) NSString* event_content;
@property(nonatomic, strong) NSString* event_time;
@property(nonatomic, strong) NSString* event_title;
@property(nonatomic, strong) NSString* event_image;
@property(nonatomic, strong) NSString* event_image_origin;
@property(nonatomic, strong) NSString* event_post_time;
@property(nonatomic, assign) NSNumber* event_id;
@property(nonatomic, assign) NSNumber* event_priority;
@property(nonatomic, assign) NSNumber*  event_answernum;
@property(nonatomic, assign) NSNumber* isApplied;
@property(nonatomic, assign) NSNumber* type;
@property(nonatomic, assign) NSNumber* user_id;
@property(nonatomic, strong) NSString* user_name;

@property(nonatomic, strong) NSNumber* need_name;
@property(nonatomic, strong) NSNumber* need_tel;
@property(nonatomic, strong) NSNumber* need_email;
@property(nonatomic, strong) NSNumber* total;

@property int last_comment_id;

@property(nonatomic, strong) NSNumber* comment_num;

@property(nonatomic, strong) drUser *publisher;

@property(nonatomic, strong) NSMutableArray *commentsData;

@end
