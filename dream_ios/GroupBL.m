//
//  GroupBL.m
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "GroupBL.h"

@implementation GroupBL

-(id) init
{
    self = [super init];
    
    if (self) {
        self.dao = [GroupDao new];
    }
    return self;
}
-(void) registerGroup:(drGroup*)model
{
    self.dao.delegate = self;
    [self.dao registerGroup:model];
    
}
-(void) approveGroup:(drGroup*)model
{
    self.dao.delegate = self;
    [self.dao approveGroup:model];
    
}
-(void) updateGroup:(drGroup*)model
{
    self.dao.delegate = self;
    [self.dao updateGroup:model];
    
}
-(void) getGroup:(drGroup*)model
{
    self.dao.delegate = self;
    [self.dao getGroup:model];
    
}

-(void) pubTweet:(drTweet*)model
{
    self.dao.delegate = self;
    [self.dao pubTweet:model];
    
}
-(void) getTweet:(drGroup*)model
{
    self.dao.delegate = self;
    [self.dao getTweet:model];
    
}
-(void) praiseTweet:(drTweet*)model
{
    self.dao.delegate = self;
    [self.dao praiseTweet:model];
    
}
//delegate part

//success
-(void) registerGroupFinished:(drGroup*)model
{
    [self.delegate registerGroupFinished:model];
    
}
-(void) approveGroupFinished:(drGroup*)model
{
    [self.delegate approveGroupFinished:model];
    
}
-(void) updateGroupFinished:(drGroup*)model
{
    [self.delegate updateGroupFinished:model];
    
}
-(void) getGroupFinished:(drGroup*)model
{
    [self.delegate getGroupFinished:model];
    
}

-(void) pubTweetFinished:(drTweet*)model
{
    [self.delegate pubTweetFinished:model];
    
}
-(void) getTweetFinished:(NSMutableArray*)model
{
    [self.delegate getTweetFinished:model];
    
}
-(void) praiseTweetFinished:(drTweet*)model
{
    [self.delegate praiseTweetFinished:model];
    
}
//failed
-(void) registerGroupFailed:(NSError *)error
{
    [self.delegate registerGroupFailed:error];
    
}
-(void) approveGroupFailed:(NSError *)error
{
    [self.delegate approveGroupFailed:error];
    
}
-(void) updateGroupFailed:(NSError *)error
{
    [self.delegate updateGroupFailed:error];
    
}
-(void) getGroupFailed:(NSError *)error
{
    [self.delegate getGroupFailed:error];
    
}

-(void) pubTweetFailed:(NSError *)error
{
    [self.delegate pubTweetFailed:error];
    
}
-(void) getTweetFailed:(NSError *)error
{
    [self.delegate getTweetFailed:error];
    
}
-(void) praiseTweetFailed:(NSError *)error
{
    [self.delegate praiseTweetFailed:error];
    
}
@end
