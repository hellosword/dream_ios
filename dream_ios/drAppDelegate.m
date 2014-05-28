//
//  drAppDelegate.m
//  dream_ios
//
//  Created by hellosword on 14-4-20.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "drAppDelegate.h"
#import "AppInstance.h"
#import "ASIFormDataRequest.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
@implementation drAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    if(_cookie==nil){
        //drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
        NSDictionary *properties = [[NSMutableDictionary alloc] init];
        [properties setValue:@"Test" forKey:NSHTTPCookieValue];
        [properties setValue:@"ASIHTTPRequestTestCookie" forKey:NSHTTPCookieName];
        [properties setValue:HOST_NAME forKey:NSHTTPCookieDomain];
        [properties setValue:[NSDate dateWithTimeIntervalSinceNow:365*24*60*60] forKey:NSHTTPCookieExpires];
        [properties setValue:@"/asi-http-request/tests" forKey:NSHTTPCookiePath];
        //myDelegate0.cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
        if(_sessionId!=nil){
            [properties setValue:_sessionId forKey:@"JSESSIONID"];
        }
        _cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
    }
    if(_user==nil){
        _user = [drUser new];
    }
    if(_user.user_alias==nil){
        //login.action?user_name=x&user_password=x
        NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/init.action"];
        NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
        NSLog(@"url-->%@",[url description]);
        __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        
        //[properties setValue:[@"Test Value" encodedCookieValue] forKey:NSHTTPCookieValue];
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
                NSString *user_alias= [resDict objectForKey:@"user_alias"];
                NSString *user_tag = [resDict objectForKey:@"user_tag"];
                _user.user_alias = user_alias;
                _user.user_tag = user_tag;
                /**/
                NSArray *cookies = [ request responseCookies ];
                // 打印 sessionid
                NSHTTPCookie *cookie = nil ;
                for (cookie in cookies) {
                    if ([[cookie name ] isEqualToString : @"JSESSIONID" ]) {
                        NSLog ( @"session name:%@,value:%@" ,[cookie name ],[cookie value ]);
                        myDelegate0.cookie=cookie;
                        _sessionId=[cookie value ];
                    }
                }
            } else {
            }
        }];
        [request setFailedBlock:^{
            //
        }];
        [request startAsynchronous];
    }
    //NSDictionary *properties = [[NSMutableDictionary alloc] init];
    //self.cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
    /*
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.window.clipsToBounds = YES;
        [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
        
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        if(orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
        {
            self.window.frame =  CGRectMake(20, 0,self.window.frame.size.width-20,self.window.frame.size.height);
            self.window.bounds = CGRectMake(20, 0, self.window.frame.size.width, self.window.frame.size.height);
        } else
        {
            self.window.frame =  CGRectMake(0,20,self.window.frame.size.width,self.window.frame.size.height-20);
            self.window.bounds = CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height);
        }
    }*/
    
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
