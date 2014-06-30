//
//  UserDao.m
//  dream_ios
//
//  Created by hellosword on 14-5-2.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "UserDAO.h"
@implementation UserDAO

-(void) initUser:(drUser*)model
{
}
-(void) getConfirmCode:(drUser*)model
{
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getRegisterCode.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.telephone forKey:@"telephone"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            //http://demo.nds.fudan.edu.cn/json/getRegisterCode.action?telephone=15201927697
            [self.delegate GetConfirmCodeFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate GetConfirmCodeFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate GetConfirmCodeFailed:error];
    }];
    [request startAsynchronous];
}
-(void) checkConfirmCode:(drUser*)model
{
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/confirmRegisterCode.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.confirm_code forKey:@"code"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            [self.delegate CheckConfirmCodeFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate CheckConfirmCodeFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate CheckConfirmCodeFailed:error];
    }];
    [request startAsynchronous];
    
}


-(void) createUser:(drUser*)model
{
    //register.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/register.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.user_name forKey:@"user_name"];
    [request setPostValue:model.user_password forKey:@"user_password"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSNumber *user_id = [resDict objectForKey:@"user_id"];
            model.user_id = user_id;
            [self.delegate CreateUserFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate CreateUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate CreateUserFailed:error];
    }];
    [request startAsynchronous];
}


-(void) checkUser:(drUser*)model
{
    //login.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/login.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    //[properties setValue:[@"Test Value" encodedCookieValue] forKey:NSHTTPCookieValue];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    //[request setRequestCookies:myDelegate0.cookie];
    //NSHTTPCookie *cookies = myDelegate0.cookie;
    //
    [request setPostValue:model.user_name forKey:@"user_name"];
    [request setPostValue:model.user_password forKey:@"user_password"];
    
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSNumber *user_id = [resDict objectForKey:@"user_id"];
            NSString *user_tag = [resDict objectForKey:@"user_tag"];
            model.user_id = user_id;
            model.user_tag = user_tag;
            /**/
            NSArray *cookies = [ request responseCookies ];
            // 打印 sessionid
            NSHTTPCookie *cookie = nil ;
            for (cookie in cookies) {
                if ([[cookie name ] isEqualToString : @"JSESSIONID" ]) {
                    NSLog ( @"session name:%@,value:%@" ,[cookie name ],[cookie value ]);
                    myDelegate0.cookie=cookie;
                }
            }
            
            [self.delegate CheckUserFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate CheckUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate CheckUserFailed:error];
    }];
    [request startAsynchronous];
    
}
-(void) checkoutUser:(drUser*)model
{
    //login.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/logout.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            [self.delegate CheckoutUserFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate CheckoutUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate CheckoutUserFailed:error];
    }];
    [request startAsynchronous];
    
}


-(void) getUserInfo:(drUser*)model
{
    
    //login.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getUserInf.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    //[properties setValue:[@"Test Value" encodedCookieValue] forKey:NSHTTPCookieValue];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    //[request setPostValue:model.user_name forKey:@"user_name"];
    //[request setPostValue:model.user_password forKey:@"user_password"];
    
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSDictionary* dic = [resDict objectForKey:@"user"];
            model.user_image = [dic objectForKey:@"avatar"];
            model.user_email = [dic objectForKey:@"email"];
            model.user_gender = [dic objectForKey:@"gender"];
            model.telephone = [dic objectForKey:@"telephone"];
            model.user_id = [dic objectForKey:@"userId"];
            model.user_type = [dic objectForKey:@"userType"];
            model.user_name = [dic objectForKey:@"username"];
                        /**/
            NSArray *cookies = [ request responseCookies ];
            // 打印 sessionid
            NSHTTPCookie *cookie = nil ;
            for (cookie in cookies) {
                if ([[cookie name ] isEqualToString : @"JSESSIONID" ]) {
                    NSLog ( @"session name:%@,value:%@" ,[cookie name ],[cookie value ]);
                    myDelegate0.cookie=cookie;
                }
            }
            
            [self.delegate getUserInfoFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getUserInfoFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getUserInfoFailed:error];
    }];
    [request startAsynchronous];

}
-(void) updateUserInfo:(drUser*)model
{
    //login.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/completeInf.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    //[properties setValue:[@"Test Value" encodedCookieValue] forKey:NSHTTPCookieValue];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    
    //user_email=x&user_gender=x&image=x
    [request setPostValue:model.user_email forKey:@"user_email"];
    [request setPostValue:model.user_gender forKey:@"user_gender"];
    [request setPostValue:model.user_image forKey:@"user_image"];
    
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSDictionary* dic = [resDict objectForKey:@"user"];
            model.user_id = [resDict objectForKey:@"user_id"];
            /**/
            NSArray *cookies = [ request responseCookies ];
            // 打印 sessionid
            NSHTTPCookie *cookie = nil ;
            for (cookie in cookies) {
                if ([[cookie name ] isEqualToString : @"JSESSIONID" ]) {
                    NSLog ( @"session name:%@,value:%@" ,[cookie name ],[cookie value ]);
                    myDelegate0.cookie=cookie;
                }
            }
            
            [self.delegate updateUserInfoFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate updateUserInfoFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate updateUserInfoFailed:error];
    }];
    [request startAsynchronous];
    
}

/*
 新增获取统一验证码接口：
 json/getValidateCode.action?telephone=x&type=x
 注：type暂时可取值findPassword
 返回：{"error_message":"","error_type":0}
 
 */
-(void) getValidateCode:(drUser*)model
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getValidateCode.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.telephone forKey:@"telephone"];
    [request setPostValue:@"findPassword" forKey:@"type"];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            //http://demo.nds.fudan.edu.cn/json/getRegisterCode.action?telephone=15201927697
            [self.delegate getValidateCodeFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getValidateCodeFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getValidateCodeFailed:error];
    }];
    [request startAsynchronous];
    
}

/*
 
 新增验证接口：
 json/confirmValidateCode.action?code=xxx
 返回：{"error_message":"","error_type":0}
 
 */
-(void) confirmValidateCode:(drUser*)model
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/confirmValidateCode.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.confirm_code forKey:@"code"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            [self.delegate confirmValidateCodeFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate confirmValidateCodeFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate confirmValidateCodeFailed:error];
    }];
    [request startAsynchronous];
    
}

/*
 
 新增修改密码接口：
 json/modifyPassword.action?type=xxx&newPassword=xxx&oldPassword=xxx
 注：type暂时取值common/findPassword两种，common代表正常修改，findPassword代表通过手机找回密码
 取common时：newPassword和oldPassword都要传；取findPassword时：只传newPassword
 返回：{"error_message":"","error_type":0}
 
 */
-(void) modifyPassword:(drUser*)model
{
    
    //login.action?user_name=x&user_password=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/completeInf.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    //[properties setValue:[@"Test Value" encodedCookieValue] forKey:NSHTTPCookieValue];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    if(model.user_mPasswordType == nil){
        model.user_mPasswordType = @"common";
    }
    [request setPostValue:model.user_mPasswordType forKey:@"type"];
    [request setPostValue:model.user_new_password forKey:@"newPassword"];
    [request setPostValue:model.user_old_password forKey:@"oldPassword"];
    
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSDictionary* dic = [resDict objectForKey:@"user"];
            model.user_id = [resDict objectForKey:@"user_id"];
            /**/
            NSArray *cookies = [ request responseCookies ];
            // 打印 sessionid
            NSHTTPCookie *cookie = nil ;
            for (cookie in cookies) {
                if ([[cookie name ] isEqualToString : @"JSESSIONID" ]) {
                    NSLog ( @"session name:%@,value:%@" ,[cookie name ],[cookie value ]);
                    myDelegate0.cookie=cookie;
                }
            }
            
            [self.delegate modifyPasswordFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate modifyPasswordFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate modifyPasswordFailed:error];
    }];
    [request startAsynchronous];

}

-(void) followUser:(drUser*)model
{
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/followUser.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.user_id forKey:@"user_id"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            [self.delegate followUserFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate followUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate followUserFailed:error];
    }];
    [request startAsynchronous];
}
-(void) getFollowingUser:(drUser*)model
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getFollowingUser.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.user_id forKey:@"user_id"];
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSMutableArray* listDict = [resDict objectForKey:@"users"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                drUser *userItem = [drUser new];
                userItem.user_image = [dic objectForKey:@"avatar"];
                userItem.user_email = [dic objectForKey:@"email"];
                userItem.user_gender = [dic objectForKey:@"gender"];
                userItem.telephone = [dic objectForKey:@"telephone"];
                userItem.user_id = [dic objectForKey:@"userId"];
                userItem.user_type = [dic objectForKey:@"userType"];
                userItem.user_name = [dic objectForKey:@"username"];
                
                [listData addObject:userItem];
            }
            [self.delegate getFollowingUserFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getFollowingUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getFollowingUserFailed:error];
    }];
    [request startAsynchronous];
    
}
-(void) searchUser:(drUser*)model
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getFollowingUser.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    if(model.user_id>0){
        [request setPostValue:model.user_id forKey:@"user_id"];
    }
    [request setPostValue:model.user_name forKey:@"username"];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] ==0)
        {
            NSMutableArray* listDict = [resDict objectForKey:@"users"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                drUser *userItem = [drUser new];
                userItem.user_image = [dic objectForKey:@"avatar"];
                userItem.user_email = [dic objectForKey:@"email"];
                userItem.user_gender = [dic objectForKey:@"gender"];
                userItem.telephone = [dic objectForKey:@"telephone"];
                userItem.user_id = [dic objectForKey:@"userId"];
                userItem.user_type = [dic objectForKey:@"userType"];
                userItem.user_name = [dic objectForKey:@"username"];
                
                [listData addObject:userItem];
            }
            [self.delegate getFollowingUserFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getFollowingUserFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getFollowingUserFailed:error];
    }];
    [request startAsynchronous];
    
}
@end
