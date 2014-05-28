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
//
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
