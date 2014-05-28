//
//  drUser.h
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface drUser : NSObject

@property(nonatomic, assign) NSNumber* user_id;
@property(nonatomic, strong) NSString* user_name;
@property(nonatomic, strong) NSString* user_email;
@property(nonatomic, strong) NSNumber* user_gender;
@property(nonatomic, strong) NSString* user_password;
@property(nonatomic, strong) NSString* user_image;
@property(nonatomic, strong) NSNumber* user_type;
@property(nonatomic, strong) NSString* telephone;
@property(nonatomic, strong) NSString* confirm_code;
@property(nonatomic, strong) NSString* user_tag;
@property(nonatomic, strong) NSString* user_alias;

@end
