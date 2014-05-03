//
// EventDAO.m
//  MyNotes
//

#import "EventDAO.h"
#import "drAppDelegate.h"

@implementation EventDAO

//插入Note方法
-(void) create:(drEvent*)model
{
    //pubEvent.action?event_title=x&event_content=x&image=x&activityTime=x&activityLocation=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubEvent.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.event_title forKey:@"event_title"];
    [request setPostValue:model.event_content forKey:@"event_content"];
    [request setPostValue:model.event_image forKey:@"image"];
    [request setPostValue:model.activityTime forKey:@"activityTime"];
    [request setPostValue:model.activityLocation forKey:@"activityLocation"];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        NSString *message = [resDict objectForKey:@"error_message"];
        NSLog(@"--->%@\n",message);
        if ([resultCodeNumber integerValue] ==0)
        {
            [self.delegate createFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate createFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate createFailed:error];
    }];
    [request startAsynchronous];
}

//删除Note方法
-(void) remove:(drEvent*)model
{
    /*
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"remove" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [self.delegate removeFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate removeFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    
    [engine enqueueOperation:op];
     */
}


    
//修改Note方法
-(void) modify:(drEvent*)model
{
  /*
    NSString *path = [HOST_PATH URLEncodedString];
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"test@51work6.com" forKey:@"email"];
    [param setValue:@"JSON" forKey:@"type"];
    [param setValue:@"modify" forKey:@"action"];
    [param setValue:model.ID forKey:@"id"];
    [param setValue:model.date forKey:@"date"];
    [param setValue:model.content forKey:@"content"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:path params:param httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *operation) {
        
        NSData *data  = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        if ([resultCodeNumber integerValue] >=0)
        {
            [self.delegate modifyFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            
            [self.delegate modifyFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* err) {
        NSError *error = [errorOp error];
        [self.delegate createFailed:error];
    }];
    
    [engine enqueueOperation:op];
*/
}

//查询所有数据方法
-(void) findAll
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/showEvent.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:@"0" forKey:@"mode"];
    [request setPostValue:@"0" forKey:@"num"];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] >=0)
        {
            NSMutableArray* listDict = [resDict objectForKey:@"events"];
            
            NSMutableArray *listData = [NSMutableArray new];
            
            for (NSDictionary* dic in listDict) {
                drEvent *event = [drEvent new];
                event.activityTime = [dic objectForKey:@"activityTime"];
                event.activityLocation = [dic objectForKey:@"activityLocation"];
                event.user_avatar = [dic objectForKey:@"user_avatar"];
                event.event_content = [dic objectForKey:@"event_content"];
                event.event_time = [dic objectForKey:@"event_time"];
                event.event_title = [dic objectForKey:@"event_title"];
                event.event_image = [dic objectForKey:@"event_image"];
                event.event_id = [dic objectForKey:@"event_id"];
                event.event_answernum = [dic objectForKey:@"event_answernum"];
                event.isApplied = [dic objectForKey:@"isApplied"];
                event.type = [dic objectForKey:@"type"];
                event.user_id = [dic objectForKey:@"user_id"];
                event.user_name = [dic objectForKey:@"user_name"];
                
                [listData addObject:event];
            }
            [self.delegate findAllFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate findAllFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate findAllFailed:error];
    }];
    [request startAsynchronous];

}

@end
