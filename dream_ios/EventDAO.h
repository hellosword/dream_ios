//
//  NoteDAO.h
//  MyNotes
//

#import "EventDAODelegate.h"
#import "drEvent.h"
#import "drComment.h"
#import "NSString+URLEncoding.h"
#import "NSNumber+Message.h"
#import "ASIFormDataRequest.h"
#import "AppInstance.h"


@interface EventDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

@property (weak, nonatomic) id <EventDAODelegate> delegate;

-(void) createEvent:(drEvent*)model;

-(void) remove:(drEvent*)model;

-(void) modify:(drEvent*)model;

-(void) getOneEvent:(drEvent*)model;

-(void) findAll;

-(void) pubComment:(drComment*)model;

-(void) getMoreComments:(drEvent*)model;

-(void) applyForEvent:(drEvent*)model by:(drUser*)user;

-(void) getAllMyPubEvents:(drEvent*)model;

-(void) getAllMyAttEvents:(drEvent*)model;

-(void) useTicket:(drEvent*)model code:(NSString*)code;

-(void) getAllParticipator:(drEvent*)model;

-(void) collectEvent:(drEvent*)model;

-(void) getUserCollection:(drEvent*)model;
@end
