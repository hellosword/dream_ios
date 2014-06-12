//
//  GroupBLDelegate.h
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#ifndef dream_ios_GroupBLDelegate_h
#define dream_ios_GroupBLDelegate_h

@class drGroup;

@protocol GroupBLDelegate

@optional

-(void) registerGroupFinished:(drGroup*)model;
-(void) approveGroupFinished:(drGroup*)model;
-(void) updateGroupFinished:(drGroup*)model;

-(void) pubTweetFinished:(drTweet*)model;
-(void) getTweetFinished:(drTweet*)model;
-(void) praiseTweetFinished:(drTweet*)model;

-(void) registerGroupFailed:(NSError *)error;
-(void) approveGroupFailed:(NSError *)error;
-(void) updateGroupFailed:(NSError *)error;

-(void) pubTweetFailed:(NSError *)error;
-(void) getTweetFailed:(NSError *)error;
-(void) praiseTweetFailed:(NSError *)error;
@end


#endif
