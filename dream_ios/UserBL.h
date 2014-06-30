//
//  UserBL.h
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "drUser.h"
#import "UserDAO.h"
#import "UserDAODelegate.h"
#import "UserBLDelegate.h"

@interface UserBL : NSObject <UserDAODelegate>

@property (weak, nonatomic) id <UserBLDelegate> delegate;

@property (strong, nonatomic) UserDAO *dao;

-(void) getConfirmCode:(drUser*)model;

-(void) checkConfirmCode:(drUser*)model;

-(void) createUser:(drUser*)model;

-(void) login:(drUser*)model;

-(void) logout:(drUser*)model;
-(void) getUserInfo:(drUser*)model;
-(void) updateUserInfo:(drUser*)model;

/*
 新增获取统一验证码接口：
 json/getValidateCode.action?telephone=x&type=x
 注：type暂时可取值findPassword
 返回：{"error_message":"","error_type":0}
 
 新增验证接口：
 json/confirmValidateCode.action?code=xxx
 返回：{"error_message":"","error_type":0}
 
 新增修改密码接口：
 json/modifyPassword.action?type=xxx&newPassword=xxx&oldPassword=xxx
 注：type暂时取值common/findPassword两种，common代表正常修改，findPassword代表通过手机找回密码
 取common时：newPassword和oldPassword都要传；取findPassword时：只传newPassword
 返回：{"error_message":"","error_type":0}
 */
-(void) getValidateCode:(drUser*)model;
-(void) confirmValidateCode:(drUser*)model;
-(void) modifyPassword:(drUser*)model;

-(void) followUser:(drUser*)model;
-(void) getFollowingUser:(drUser*)model;
-(void) searchUser:(drUser*)model;

@end
