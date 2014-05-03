//
//  EventDAODelegate.h
//  PersistenceLayer
//

//#import <Foundation/Foundation.h>

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

/*
//修改Note方法 成功
- (void)modifyFinished;
//修改Note方法 失败
- (void)modifyFailed:(NSError *)error;
*/
@end
