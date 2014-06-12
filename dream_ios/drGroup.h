//
//  drGroup.h
//  dream_ios
//
//  Created by hellosword on 14-6-12.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface drGroup : NSObject

@property(nonatomic, strong) NSString* group_name;
@property(nonatomic, strong) NSString* initator_name;
@property(nonatomic, strong) NSString* initator_telephone;
@property(nonatomic, strong) NSString* initator_SID;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, strong) NSString* group_id;


@property(nonatomic, strong) NSString* notice;
@property(nonatomic, strong) NSString* image;

//apply result :yes/no string 
@property(nonatomic, strong) NSString* applyResult;
@end
