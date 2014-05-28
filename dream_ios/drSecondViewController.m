//
//  drSecondViewController.m
//  dream_ios
//
//  Created by hellosword on 14-4-20.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "drSecondViewController.h"
#import "drAppDelegate.h"
@interface drSecondViewController ()

@end

@implementation drSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.eventbl = [EventBL new];
    self.eventbl.delegate = self;
    
    self.userbl = [UserBL new];
    self.userbl.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createEventFinished
{
    NSLog(@"create ok:\n");
}
- (void)createEventFailed:(NSError *)error;
{
    
}
//
- (void)CheckUserFinished:(drUser *)model{
    NSLog(@"login ok:%@\n",model.description);
}
- (void)CheckUserFailed:(NSError *)error;
{
}
- (IBAction)onClick:(id)sender {
    NSString *name = _userNameTxt.text;
    NSString *pwd = _userPwdTxt.text;
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    drUser *user = myDelegate0.user;
    user.user_name = name;
    user.user_password = pwd;
    [_userbl login:user];
}

- (IBAction)pubEventBtnListener:(id)sender {
    drEvent *e=[drEvent new];
    e.event_title=@"atang shabi";
    e.event_content = @"zai gan yici";
    e.event_image = nil;
    e.activityTime=[NSDate new];
    e.activityLocation=@"703";
    [self.eventbl createEvent:e];
}
@end
