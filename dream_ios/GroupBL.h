//
//  GroupBL.h
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "drGroup.h"
#import "drTweet.h"

#import "GroupDAO.h"
#import "GroupDAODelegate.h"
#import "GroupBLDelegate.h"

@interface GroupBL : NSObject <GroupDAODelegate>


@property (weak, nonatomic) id <GroupBLDelegate> delegate;

@property (strong, nonatomic) GroupDao *dao;

-(void) registerGroup:(drGroup*)model;
//这个接口好像不应该出现在这里，不过还是先加上吧
-(void) approveGroup:(drGroup*)model;
-(void) updateGroup:(drGroup*)model;

-(void) pubTweet:(drTweet*)model;
-(void) getTweet:(drTweet*)model;
-(void) praiseTweet:(drTweet*)model;

@end
