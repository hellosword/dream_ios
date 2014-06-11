//
//  UserDAO.h
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
#import "ASIFormDataRequest.h"
#import "AppInstance.h"

#import "drUser.h"
#import "UserDAODelegate.h"
@interface UserDAO : NSObject


@property (weak, nonatomic) id <UserDAODelegate> delegate;
/*
//插入Note方法
-(void) create:(drUser*)model;

//删除Note方法
-(void) remove:(drEvent*)model;

//修改Note方法
-(void) modify:(drEvent*)model;

//查询所有数据方法
-(void) findAll;
 */
-(void) getConfirmCode:(drUser*)model;
-(void) checkConfirmCode:(drUser*)model;

-(void) createUser:(drUser*)model;
-(void) checkUser:(drUser*)model;
-(void) checkoutUser:(drUser*)model;

-(void) initUser:(drUser*)model;
-(void) getUserInfo:(drUser*)model;
-(void) updateUserInfo:(drUser*)model;

//

-(void) getValidateCode:(drUser*)model;
-(void) confirmValidateCode:(drUser*)model;
-(void) modifyPassword:(drUser*)model;

@end


