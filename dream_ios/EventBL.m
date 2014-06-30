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
    [self.dao createEvent:model];
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

-(void)getOneEvent:(drEvent *)model
{
    self.dao.delegate = self;
    [self.dao getOneEvent:model];
}
//修改数据方法
-(void) modifyEvent:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao modify:model];
}


-(void) pubComment:(drComment*)model
{
    self.dao.delegate = self;
    [self.dao pubComment:model];
}

-(void) getMoreComments:(drEvent *)model
{
    self.dao.delegate = self;
    [self.dao getMoreComments:model];
}

-(void) applyForEvent:(drEvent*)model by:(drUser*)user{
    self.dao.delegate = self;
    [self.dao applyForEvent:model by:user];
    
}

-(void) getAllMyPubEvents:(drEvent*)model{
    self.dao.delegate = self;
    [self.dao getAllMyPubEvents:model];
    
}

-(void) getAllMyAttEvents:(drEvent*)model{
    self.dao.delegate = self;
    [self.dao getAllMyAttEvents:model];
    
}

-(void) useTicket:(drEvent*)model code:(NSString*)code{
    self.dao.delegate = self;
    [self.dao useTicket:model code:code];
    
}

-(void) getAllParticipator:(drEvent*)model{
    self.dao.delegate = self;
    [self.dao getAllParticipator:model];
    
}

-(void) collectEvent:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao collectEvent:model];
    
}
-(void) getUserCollection:(drEvent*)model
{
    self.dao.delegate = self;
    [self.dao getUserCollection:model];
    
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


- (void)getOneEventFinished:(drEvent*)model
{
    [_delegate getOneEventFinished:model];
}
- (void)getOneEventFailed:(NSError*)error
{
    [_delegate getOneEventFailed:error];
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


- (void)pubCommentFinished:(drComment *)model{
    [_delegate pubCommentFinished:model];
    
}
- (void)pubCommentFailed:(NSError *)error{
    [_delegate pubCommentFailed:error];
    
}

- (void)getMoreCommentsFinished:(NSMutableArray *)list{
    [_delegate getMoreCommentsFinished:list];
    
}
- (void)getMoreCommentsFailed:(NSError *)error{
    [_delegate getMoreCommentsFailed:error];
    
}

-(void) applyForEventFinished{
    [_delegate applyForEventFinished];
}
-(void) applyForEventFailed:(NSError *)error{
    [_delegate applyForEventFailed:error];
}

-(void) getAllMyPubEventsFinished:(NSMutableArray *)list{
    [_delegate getAllMyPubEventsFinished:list];
}
-(void) getAllMyPubEventsFailed:(NSError *)error{
    [_delegate getAllMyPubEventsFailed:error];
}

-(void) getAllMyAttEventsFinished:(NSMutableArray *)list{
    [_delegate getAllMyAttEventsFinished:list];
}
-(void) getAllMyAttEventsFailed:(NSError *)error{
    [_delegate getAllMyAttEventsFailed:error];
}

-(void) useTicketFinished{
    [_delegate useTicketFinished];
}
-(void) useTicketFailed:(NSError *)error{
    [_delegate useTicketFailed:error];
}

-(void) getAllParticipatorFinished:(NSMutableArray *)list{
    [_delegate getAllParticipatorFinished:list];
}
-(void) getAllParticipatorFailed:(NSError *)error{
    [_delegate getAllParticipatorFailed:error];
}
//v3.0

-(void) collectEventFinished:(drEvent *)model
{
    [_delegate collectEventFinished:model];
}
-(void) getUserCollectionFinished:(NSMutableArray *)list
{
    [_delegate getUserCollectionFinished:list];
}
-(void) collectEventFailed:(NSError *)error
{
    [_delegate collectEventFailed:error];
}
-(void) getUserCollectionFailed:(NSError *)error
{
    [_delegate getUserCollectionFailed:error];
}

@end
