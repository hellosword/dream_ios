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

@end
