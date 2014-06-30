#import "drEvent.h"
#import "drComment.h"
@protocol EventBLDelegate

@optional
- (void)findAllEventsFinished:(NSMutableArray *)list;
- (void)findAllEventsFailed:(NSError *)error;

- (void)createEventFinished;
- (void)createEventFailed:(NSError *)error;

- (void)removeEventFinished;
- (void)removeEventFailed:(NSError *)error;

- (void)modifyEventFinished;
- (void)modifyEventFailed:(NSError *)error;

- (void)getOneEventFinished:(drEvent *)model;
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


@end
