//
//  drFirstViewController.h
//  dream_ios
//
//  Created by hellosword on 14-4-20.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventBLDelegate.h"
#import "EventBL.h"
@interface drFirstViewController : UITableViewController <EventBLDelegate>

//@property (strong, nonatomic) DetailViewController *detailViewController;
//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;
//删除数据索引
@property (nonatomic,assign) NSUInteger deletedIndex;
//删除数据
@property (nonatomic,strong) drEvent *deletedNote;

//BL对象
@property (nonatomic,strong) EventBL *_bl;
@end
