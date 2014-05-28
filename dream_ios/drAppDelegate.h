//
//  drAppDelegate.h
//  dream_ios
//
//  Created by hellosword on 14-4-20.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "drUser.h"
@interface drAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSHTTPCookie *cookie;
@property (strong, nonatomic) NSString *sessionId;
@property (strong, nonatomic) drUser *user;
@end
