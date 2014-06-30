//
//  EventDAODelegate.h
//  PersistenceLayer
//

//#import <Foundation/Foundation.h>

#import "drComment.h"
@class drEvent;

@protocol EventDAODelegate

@optional
//查询所有数据方法 成功
- (void)findAllFinished:(NSMutableArray *)list;
//查询所有数据方法 失败
- (void)findAllFailed:(NSError *)error;

//按照主键查询数据方法 成功
- (void)findByIdFinished:(drEvent *)model;
//按照主键查询数据方法 失败
- (void)findByIdFailed:(NSError *)error;

//插入Note方法 成功
- (void)createFinished;
//插入Note方法 失败
- (void)createFailed:(NSError *)error;

//删除Note方法 成功
- (void)removeFinished;
//删除Note方法 失败
- (void)removeFailed:(NSError *)error;


//按照主键查询数据方法 成功
- (void)getOneEventFinished:(drEvent *)model;
//按照主键查询数据方法 失败
- (void)getOneEventFailed:(NSError *)error;


- (void)pubCommentFinished:(drComment *)model;
- (void)pubCommentFailed:(NSError *)error;

- (void)getMoreCommentsFinished:(NSMutableArray *)list;
- (void)getMoreCommentsFailed:(NSError *)error;


-(void) applyForEventFinished;
-(void) applyForEventFailed:(NSError *)error;

-(void) getAllMyPubEventsFinished:(NSMutableArray *)list;
-(void) getAllMyPubEventsFailed:(NSError *)error;

-(void) getAllMyAttEventsFinished:(NSMutableArray *)list;
-(void) getAllMyAttEventsFailed:(NSError *)error;

-(void) useTicketFinished;
-(void) useTicketFailed:(NSError *)error;

-(void) getAllParticipatorFinished:(NSMutableArray *)list;
-(void) getAllParticipatorFailed:(NSError *)error;

//v3.0

-(void) collectEventFinished:(drEvent*)model;
-(void) getUserCollectionFinished:(NSMutableArray *)list;

-(void) collectEventFailed:(NSError *)error;
-(void) getUserCollectionFailed:(NSError *)error;
/*
//修改Note方法 成功
- (void)modifyFinished;
//修改Note方法 失败
- (void)modifyFailed:(NSError *)error;
*/
@end
