//
//  NoteDAO.h
//  MyNotes
//

#import "EventDAODelegate.h"
#import "drEvent.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
#import "ASIFormDataRequest.h"
#import "AppInstance.h"


@interface EventDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

@property (weak, nonatomic) id <EventDAODelegate> delegate;

//插入Note方法
-(void) create:(drEvent*)model;

//删除Note方法
-(void) remove:(drEvent*)model;

//修改Note方法
-(void) modify:(drEvent*)model;

//查询所有数据方法
-(void) findAll;


@end
