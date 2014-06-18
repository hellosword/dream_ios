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
    
    self.imgTransUtil = [ImageTransferUtility new];
    self.imgTransUtil.delegate = self;
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

- (IBAction)phoneCodeDown:(id)sender{
    drUser *user = [drUser new];
    user.telephone = _userNameTxt.text;
    //@"15201927697";
    //user.user_password = pwd;
    [_userbl getConfirmCode:user];
    
}

- (IBAction)getImageList:(id)sender {
    //imgView2;
    NSString* str0 = @"http://img10.360buyimg.com/da/jfs/t172/193/1037401743/14149/c76dd62/539ea57dNf3b195b8.gif";
    NSString* str1 = @"http://www.baidu.com/img/baidu_sylogo1.gif";
    NSMutableArray* ma = [NSMutableArray new];
    [ma addObject:str0];
    [ma addObject:str1];
    [_imgTransUtil startImageListQuery:ma];
}

- (IBAction)checkCodeDown:(id)sender{
    NSString *code = _userNameTxt.text;
    drUser *user = [drUser new];
    user.confirm_code = code;
    [_userbl checkConfirmCode:user];
    
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
- (void)getImageListItemFinished:(NSData *)data imgIndex:(int)index
{
    
    UIImage* img;
    if(index == 0){
        img = [UIImage imageWithData:data];
        [_imgView1 setImage:img];
    }else{
        img = [UIImage imageWithData:data];
        [_imgView2 setImage:img];
    }
    NSLog(@"load image %d ok",index);
    
}
- (void)getImageListItemFailed:(NSError *)error imgIndex:(int)index
{
    NSLog(@"load image %d error",index);
}
- (void)getImageListFinished:(int)cnt
{
    NSLog(@"load images %d all",cnt);
    
}


- (void)GetConfirmCodeFinished:(drUser *)model
{
}
- (void)GetConfirmCodeFailed:(NSError *)error;
{

}
- (void)CheckConfirmCodeFinished:(drUser *)model;
{
    
}
- (void)CheckConfirmCodeFailed:(NSError *)error;
{
}
@end
