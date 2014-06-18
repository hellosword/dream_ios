

#import "drEvent.h"
#import "drComment.h"
#import "EventDAO.h"
#import "EventDAODelegate.h"
#import "EventBLDelegate.h"
#import "ConnectionUIController.h"
@interface EventBL : NSObject <EventDAODelegate>

@property (weak, nonatomic) id <EventBLDelegate> delegate;

@property (strong, nonatomic) EventDAO *dao;

@property (strong,nonatomic) ConnectionUIController *cuc;

//插入Note方法
-(void) createEvent:(drEvent*)model;

//删除Note方法
-(void) removeEvent:(drEvent*)model;

//查询所有数据方法
-(void) findAllEvents;

//修改数据方法
-(void) modifyEvent:(drEvent*)model;

-(void) getOneEvent:(drEvent*)model;

-(void) pubComment:(drComment*)model;

-(void) getMoreComments:(drEvent*)model;

-(void) applyForEvent:(drEvent*)model by:(drUser*)user;

-(void) getAllMyPubEvents:(drEvent*)model;

-(void) getAllMyAttEvents:(drEvent*)model;

-(void) useTicket:(drEvent*)model code:(NSString*)code;

-(void) getAllParticipator:(drEvent*)model;
@end
