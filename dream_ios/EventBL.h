

#import "drEvent.h"
#import "EventDAO.h"
#import "EventDAODelegate.h"
#import "EventBLDelegate.h"

@interface EventBL : NSObject <EventDAODelegate>

@property (weak, nonatomic) id <EventBLDelegate> delegate;

@property (strong, nonatomic) EventDAO *dao;

//插入Note方法
-(void) createEvent:(drEvent*)model;

//删除Note方法
-(void) removeEvent:(drEvent*)model;

//查询所有数据方法
-(void) findAllEvents;

//修改数据方法
-(void) modifyEvent:(drEvent*)model;

@end
