//
//  GroupDao.m
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "GroupDao.h"

@implementation GroupDao

-(void) registerGroup:(drGroup*)model
{
    //registerGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/registerGroup.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.group_name forKey:@"group_name"];
    [request setPostValue:model.initator_name forKey:@"initator_name"];
    [request setPostValue:model.initator_telephone forKey:@"initator_telephone"];
    [request setPostValue:model.initator_SID forKey:@"initator_SID"];
    [request setPostValue:model.description forKey:@"description"];
    
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
            [self.delegate registerGroupFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate registerGroupFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate registerGroupFailed:error];
    }];
    [request startAsynchronous];
}
-(void) approveGroup:(drGroup*)model
{
    //approveGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/approveGroup.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.group_id forKey:@"group_id"];
    [request setPostValue:model.applyResult forKey:@"type"];
    
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
            [self.delegate approveGroupFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate approveGroupFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate approveGroupFailed:error];
    }];
    [request startAsynchronous];
    
}
-(void) updateGroup:(drGroup*)model
{
    //updateGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/updateGroup.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.group_id forKey:@"group_id"];
    [request setPostValue:model.notice forKey:@"notice"];
    [request setPostValue:model.image forKey:@"image"];
    [request setPostValue:model.description forKey:@"description"];
    
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
            [self.delegate updateGroupFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate updateGroupFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate updateGroupFailed:error];
    }];
    [request startAsynchronous];
    
}

-(void) getGroup:(drGroup*)model
{
    //updateGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getGroup.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.user_id forKey:@"user_id"];
    [request setPostValue:model.groupGettingType forKey:@"type"];
    
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
            //[self.delegate updateGroupFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getGroupFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getGroupFailed:error];
    }];
    [request startAsynchronous];
    
}
-(void) pubTweet:(drTweet*)model{
    //updateGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubTweet.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.group_id forKey:@"group_id"];
    [request setPostValue:model.content forKey:@"content"];
    
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
            [self.delegate pubTweetFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate pubTweetFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate pubTweetFailed:error];
    }];
    [request startAsynchronous];
    
}

#error unfinished
-(void) getTweet:(drGroup*)model{
    //updateGroup.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubTweet.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.tweetGettingType forKey:@"type"];
    if( [model.tweetGettingType caseInsensitiveCompare:@"list"] == NSOrderedSame)
    {
        [request setPostValue:model.group_id forKey:@"group_id"];
        
        if(model.tweet_id>0){
            [request setPostValue:[NSNumber numberWithInt:model.tweet_id] forKey:@"tweet_id"];
        }
    }else{
        [request setPostValue:[NSNumber numberWithInt:model.tweet_id] forKey:@"tweet_id"];
    }
    
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

            //[self.delegate getTweetFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getTweetFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getTweetFailed:error];
    }];
    [request startAsynchronous];
    
}
-(void) praiseTweet:(drTweet*)model{
    
    //praiseTweet.action
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/praiseTweet.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.tweet_id forKey:@"tweet_id"];
    [request setPostValue:model.praiseType forKey:@"type"];
    
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
            [self.delegate praiseTweetFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate praiseTweetFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate praiseTweetFailed:error];
    }];
    [request startAsynchronous];

}

@end
