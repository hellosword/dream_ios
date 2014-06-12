//
//  GroupDao.h
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIFormDataRequest.h"
#import "AppInstance.h"
#import "NSString+URLEncoding.h"
#import "drAppDelegate.h"

#import "drGroup.h"
#import "drTweet.h"
#import "GroupDAODelegate.h"

@interface GroupDao : NSObject


@property (weak, nonatomic) id <GroupDAODelegate> delegate;

-(void) registerGroup:(drGroup*)model;
-(void) approveGroup:(drGroup*)model;
-(void) updateGroup:(drGroup*)model;

-(void) pubTweet:(drTweet*)model;
-(void) getTweet:(drTweet*)model;
-(void) praiseTweet:(drTweet*)model;

@end
