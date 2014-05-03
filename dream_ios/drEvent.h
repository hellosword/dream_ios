//
//  drEvent.h
//  dream_ios
//
//  Created by hellosword on 14-4-23.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface drEvent : NSObject

@property(nonatomic, strong) NSDate* activityTime;
@property(nonatomic, strong) NSString* activityLocation;
@property(nonatomic, strong) NSString* user_avatar;
@property(nonatomic, strong) NSString* event_content;
@property(nonatomic, strong) NSString* event_time;
@property(nonatomic, strong) NSString* event_title;
@property(nonatomic, strong) NSString* event_image;
@property(nonatomic, assign) NSNumber* event_id;
@property(nonatomic, assign) NSNumber*  event_answernum;
@property(nonatomic, assign) NSNumber* isApplied;
@property(nonatomic, assign) NSNumber* type;
@property(nonatomic, assign) NSNumber* user_id;
@property(nonatomic, strong) NSString* user_name;

@end
