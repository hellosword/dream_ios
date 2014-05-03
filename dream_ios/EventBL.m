//
//  NoteBL.m
//  MyNotes
//
//  Created by 关东升 on 12-9-26.
//  本书网站：http://www.iosbook3.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import "EventBL.h"

@implementation EventBL

-(id) init
{
    self = [super init];
    
    if (self) {
        self.dao = [EventDAO new];
    }
    return self;
}

//插入Note方法
-(void) createEvent:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao create:model];
}

//删除Note方法
-(void) removeEvent:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao remove:model];
}

//查询所有数方法
-(void) findAllEvents
{
    self.dao.delegate = self;
    [self.dao findAll];
}


//修改数据方法
-(void) modifyEvent:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao modify:model];
}

#pragma --mark NoteDAODelegate 委托方法
//查询所有数据方法 成功
- (void)findAllFinished:(NSMutableArray *)list
{
    [_delegate findAllEventsFinished:list];
}

//查询所有数据方法 失败
- (void)findAllFailed:(NSError *)error
{
    [_delegate findAllEventsFailed:error];
}

//插入Note方法 成功
- (void)createFinished
{
    [_delegate createEventFinished];
}

//插入Note方法 失败
- (void)createFailed:(NSError *)error
{
    [_delegate createEventFailed:error];
}

//删除Note方法 成功
- (void)removeFinished
{
    [_delegate removeEventFinished];
}
//删除Note方法 失败
- (void)removeFailed:(NSError *)error
{
    [_delegate removeEventFailed:error];
}
//修改Note方法 成功
- (void)modifyFinished
{
    [_delegate modifyEventFinished];
}

//修改Note方法 失败
- (void)modifyFailed:(NSError *)error
{
    [_delegate modifyEventFailed:error];
}

@end
