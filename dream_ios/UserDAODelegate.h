//
//  UserDAODelegate.h
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//


@class drUser;

@protocol UserDAODelegate

@optional
//
- (void)InitUserFinished:(drUser *)model;
- (void)InitUserFailed:(NSError *)error;

//
- (void)GetConfirmCodeFinished:(drUser *)model;
- (void)GetConfirmCodeFailed:(NSError *)error;

//
- (void)CheckConfirmCodeFinished:(drUser *)model;
- (void)CheckConfirmCodeFailed:(NSError *)error;

- (void)CreateUserFinished:(drUser *)model;
- (void)CreateUserFailed:(NSError *)error;

//
- (void)CheckUserFinished:(drUser *)model;
- (void)CheckUserFailed:(NSError *)error;

//
- (void)CheckoutUserFinished:(drUser *)model;
- (void)CheckoutUserFailed:(NSError *)error;

- (void)getUserInfoFinished:(drUser *)model;
- (void)getUserInfoFailed:(NSError *)error;

- (void)updateUserInfoFinished:(drUser *)model;
- (void)updateUserInfoFailed:(NSError *)error;

/*
- (void)CheckUserFinished:(NSMutableArray *)list;
- (void)CheckUserFailed:(NSError *)error;
*/

@end