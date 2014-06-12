//
//  drTweet.h
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface drTweet : NSObject

@property(nonatomic, strong) NSString* user_id;

@property(nonatomic, strong) NSString* group_id;

@property(nonatomic, strong) NSString* tweet_id;

@property(nonatomic, strong) NSString* content;

@property(nonatomic, strong) NSString* type;
@property(nonatomic, strong) NSString* praiseType;//填入 praise或者oppose

@end
