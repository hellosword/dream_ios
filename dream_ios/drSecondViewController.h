//
//  drSecondViewController.h
//  dream_ios
//
//  Created by hellosword on 14-4-20.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserBLDelegate.h"
#import "EventBLDelegate.h"
#import "EventBL.h"
#import "UserBL.h"
#import "drUser.h"

#import "ImageTransferUtility.h"

@interface drSecondViewController : UIViewController <EventBLDelegate,UserBLDelegate,ImageTransferDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *userPwdTxt;
@property (weak, nonatomic) IBOutlet UITextView *resultTxt;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIImageView *imgView1;
@property (weak, nonatomic) IBOutlet UIImageView *imgView2;


@property (nonatomic,strong) EventBL *eventbl;
@property (nonatomic,strong) UserBL *userbl;
@property (nonatomic,strong) ImageTransferUtility *imgTransUtil;

- (IBAction)onClick:(id)sender;
- (IBAction)pubEventBtnListener:(id)sender;

- (IBAction)checkCodeDown:(id)sender;
- (IBAction)phoneCodeDown:(id)sender;
- (IBAction)getImageList:(id)sender;
@end
