//
//  UserBL.m
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "UserBL.h"

@implementation UserBL

-(id) init
{
    self = [super init];
    
    if (self) {
        self.dao = [UserDAO new];
    }
    return self;
}
//发送手机验证码，需要传入一个drUser实体，其中只要求手机号有效
-(void) getConfirmCode:(drUser*)model{
    self.dao.delegate = self;
    [self.dao getConfirmCode:model];
}

-(void) checkConfirmCode:(drUser*)model{
    self.dao.delegate = self;
    [self.dao checkConfirmCode:model];
}

-(void) createUser:(drUser*)model{
    self.dao.delegate = self;
    [self.dao createUser:model];
}

-(void) login:(drUser*)model{
    self.dao.delegate = self;
    [self.dao checkUser:model];
}

-(void) logout:(drUser*)model{
    self.dao.delegate = self;
    [self.dao checkoutUser:model];
}

-(void) getUserInfo:(drUser*)model{
    self.dao.delegate = self;
    [self.dao getUserInfo:model];
}
-(void) updateUserInfo:(drUser*)model{
    self.dao.delegate = self;
    [self.dao updateUserInfo:model];
}


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
-(void) getValidateCode:(drUser*)model
{
    self.dao.delegate = self;
    [self.dao getValidateCode:model];
    
}
-(void) confirmValidateCode:(drUser*)model;
{
    self.dao.delegate = self;
    [self.dao confirmValidateCode:model];
    
}
-(void) modifyPassword:(drUser*)model;
{
    self.dao.delegate = self;
    [self.dao modifyPassword:model];
    
}
//------------------------------------------------

-(void) getValidateCodeFinished:(drUser*)model
{
    [self.delegate getValidateCodeFinished:model];
    
}
-(void) getValidateCodeFailed:(NSError *)error
{
    [self.delegate getValidateCodeFailed:error];
    
}
-(void) confirmValidateCodeFinished:(drUser*)model
{
    [self.delegate confirmValidateCodeFinished:model];
    
}
-(void) confirmValidateCodeFailed:(NSError *)error
{
    [self.delegate confirmValidateCodeFailed:error];
    
}
-(void) modifyPasswordFinished:(drUser*)model
{
    [self.delegate modifyPasswordFinished:model];
    
}
-(void) modifyPasswordFailed:(NSError *)error
{
    [self.delegate modifyPasswordFailed:error];
    
}

- (void)GetConfirmCodeFinished:(drUser *)model
{
    [self.delegate GetConfirmCodeFinished:model];
}
- (void)GetConfirmCodeFailed:(NSError *)error;
{
    [self.delegate GetConfirmCodeFailed:error];
}
//
- (void)CheckConfirmCodeFinished:(drUser *)model;
{
    [self.delegate CheckConfirmCodeFinished:model];
}
- (void)CheckConfirmCodeFailed:(NSError *)error;
{
    [self.delegate CheckConfirmCodeFailed:error];
}

- (void)CreateUserFinished:(drUser *)model;
{
    [self.delegate CreateUserFinished:model];
}
- (void)CreateUserFailed:(NSError *)error;
{
    [self.delegate CreateUserFailed:error];
}
//
- (void)CheckUserFinished:(drUser *)model;
{
    [self.delegate CheckUserFinished:model];
}
- (void)CheckUserFailed:(NSError *)error;
{
    [self.delegate CheckUserFailed:error];
}
//
- (void)CheckoutUserFinished:(drUser *)model;
{
    [self.delegate CheckoutUserFinished:model];
}
- (void)CheckoutUserFailed:(NSError *)error;
{
    [self.delegate CheckoutUserFailed:error];
}

- (void)getUserInfoFinished:(drUser *)model{
    [self.delegate getUserInfoFinished:model];
}
- (void)getUserInfoFailed:(NSError *)error{
    [self.delegate getUserInfoFailed:error];
    
}

- (void)updateUserInfoFinished:(drUser *)model{
    [self.delegate updateUserInfoFinished:model];
    
}
- (void)updateUserInfoFailed:(NSError *)error{
    [self.delegate updateUserInfoFailed:error];
    
}
@end
