

@protocol EventBLDelegate

@optional
//查询所有数据方法 成功
- (void)findAllEventsFinished:(NSMutableArray *)list;
//查询所有数据方法 失败
- (void)findAllEventsFailed:(NSError *)error;

- (void)createEventFinished;
- (void)createEventFailed:(NSError *)error;

//删除Note方法 成功
- (void)removeEventFinished;
//删除Note方法 失败
- (void)removeEventFailed:(NSError *)error;

//修改Note方法 成功
- (void)modifyEventFinished;
//修改Note方法 失败
- (void)modifyEventFailed:(NSError *)error;


@end
