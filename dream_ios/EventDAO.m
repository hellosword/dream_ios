//
// EventDAO.m
//  MyNotes
//

#import "EventDAO.h"
#import "drAppDelegate.h"

@implementation EventDAO

//插入Event方法,是否可以报名 取决于 isapplied字段
-(void) createEvent:(drEvent*)model
{
    //pubEvent.action?event_title=x&event_content=x&image=x&activityTime=x&activityLocation=x
    
    //pubApply.action? event_title=x&event_content=x&name=1&telephone=1&email=1&total=100&image= 图 &activityTime=x&activityLocation=x
    NSString *str;
    if(model.isApplied.intValue==0){
        str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubEvent.action"];
    }else{
        str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubApply.action"];
    }
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.event_title forKey:@"event_title"];
    [request setPostValue:model.event_content forKey:@"event_content"];
    [request setPostValue:model.event_image forKey:@"image"];
    [request setPostValue:model.activityTime forKey:@"activityTime"];
    [request setPostValue:model.activityLocation forKey:@"activityLocation"];
    if(model.isApplied.intValue==1){
        [request setPostValue:model.need_name forKey:@"name"];
        [request setPostValue:model.need_tel forKey:@"telephone"];
        [request setPostValue:model.need_email forKey:@"email"];
        [request setPostValue:model.total forKey:@"total"];
    }
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

//删除Event方法
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
            NSString* message = [resDict objectForKey:@"error_message"];
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

-(void) getOneEvent:(drEvent*)model
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getOneEvent.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.event_id forKey:@"event_id"];
    if(model.last_comment_id>0){
        [request setPostValue:[NSNumber numberWithInt:model.last_comment_id] forKey:@"comment_id"];
    }
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] == 0)
        {
            /*
             
             vent: {activityLocation:null, activityTime:null, commentNum:4,…}
             activityLocation: null
             activityTime: null
             commentNum: 4
             comments: [{commentId:11, content:这是一条回复, image:nullnull, postTime:2014-04-19 16:37, replyNum:0, usable:1,…},…]
             content: "本届活动由复旦大学微电子学院团学联学术部、药学院团学联学术部、计算机科学与技术学院与软件工程学院团学联学术部联合举办，	复旦学生网倾力协助。本次比赛初赛共有20题，其中15题为公共题，5题为专业题。每道题都有一定的限时，请在规定时间内作出选择，一旦进入下一道题不可回退。每一位同学只有一次答题的机会，一旦答题过程中离开就失去比赛资格了哦，请注意！为了保证网页正常请禁用chrome插件，若有问题请联系我们"
             eventId: 1
             image: "images/event/01.png"
             isApplied: 0
             originImage: "images/event/origin/01.png"
             postTime: "2014-04-20 13:53"
             priority: 0
             title: "纵横慧者之贤，问鼎智者之巅"
             type: 0
             user: {email:, gender:0, avatar:images/avatar/8d5a63e98fd845cb9f67a6db660290e7.jpg, telephone:18801734731,…}
             */
            NSDictionary* event = [resDict objectForKey:@"event"];
            
            model.activityLocation = [event objectForKey:@"activityLocation"];
            model.activityTime = [event objectForKey:@"activityTime"];
            model.comment_num = [event objectForKey:@"commentNum"];
            model.event_content = [event objectForKey:@"content"];
            model.event_id = [event objectForKey:@"eventId"];
            model.event_image = [event objectForKey:@"image"];
            model.isApplied = [event objectForKey:@"isApplied"];
            model.event_image_origin = [event objectForKey:@"originImage"];
            model.event_post_time = [event objectForKey:@"postTime"];
            model.event_priority = [event objectForKey:@"priority"];
            model.event_title = [event objectForKey:@"title"];
            model.type = [event objectForKey:@"type"];
            
            //read publisher information
            NSDictionary* userDic = [event objectForKey:@"user"];
            
            drUser* user = [drUser new];
            /*
             avatar: "images/avatar/8d5a63e98fd845cb9f67a6db660290e7.jpg"
             email: ""
             gender: 0
             telephone: "18801734731"
             usable: 1
             userId: 1
             userType: 0
             username: "草如花"
             */
            user.user_image = [userDic objectForKey:@"avatar"];
            user.user_email = [userDic objectForKey:@"email"];
            user.user_gender = [userDic objectForKey:@"gender"];
            user.telephone = [userDic objectForKey:@"telephone"];
            user.user_id = [userDic objectForKey:@"userId"];
            user.user_type = [userDic objectForKey:@"userType"];
            user.user_name = [userDic objectForKey:@"username"];
            
            model.publisher = user;
            
            //here read in the comments
            NSMutableArray*  commentsDics = [event objectForKey:@"comments"];
            
            NSMutableArray* commentsData = [NSMutableArray new];
            int max_id = -1;
            for (NSDictionary* cmd in commentsDics) {
                drComment *cm =[drComment new];
                
                
                cm.commentId = [cmd objectForKey:@"commentId"];
                cm.content = [cmd objectForKey:@"content"];
                cm.postTime = [cmd objectForKey:@"postTime"];
                cm.replyNum = [cmd objectForKey:@"replyNum"];
                
                if([cm.commentId intValue]>max_id)
                    max_id = [cm.commentId intValue];
                
                //read publisher information
                NSDictionary* userDic = [cmd objectForKey:@"user"];
                
                drUser* user = [drUser new];
                user.user_image = [userDic objectForKey:@"avatar"];
                user.user_email = [userDic objectForKey:@"email"];
                user.user_gender = [userDic objectForKey:@"gender"];
                user.telephone = [userDic objectForKey:@"telephone"];
                user.user_id = [userDic objectForKey:@"userId"];
                user.user_type = [userDic objectForKey:@"userType"];
                user.user_name = [userDic objectForKey:@"username"];
                
                
                cm.publisher = user;
                                
                [commentsData addObject:cm];
            }
            model.last_comment_id = max_id;
            model.commentsData = commentsData;
            
            [self.delegate getOneEventFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getOneEventFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getOneEventFailed:error];
    }];
    [request startAsynchronous];
}


-(void) pubComment:(drComment*)model{
    //pubComment.action?comment_content=x&event_id=x
    NSString *str;
    
    str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubComment.action"];
    
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.content forKey:@"comment_content"];
    [request setPostValue:model.eventId forKey:@"event_id"];

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
            [self.delegate pubCommentFinished:model];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate pubCommentFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate pubCommentFailed:error];
    }];
    [request startAsynchronous];
}

-(void) getMoreComments:(drEvent*)model{
    //getMoreComments.action?event_id=x&comment_id=x
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getMoreComments.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.event_id forKey:@"event_id"];
    if(model.last_comment_id>0){
        [request setPostValue:[NSNumber numberWithInt:model.last_comment_id] forKey:@"comment_id"];
    }
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] == 0)
        {
            
            
            //here read in the comments
            NSMutableArray*  commentsDics = [resDict objectForKey:@"comments"];
            
            NSMutableArray* commentsData = [NSMutableArray new];
            for (NSDictionary* cmd in commentsDics) {
                drComment *cm =[drComment new];
                
                
                cm.commentId = [cmd objectForKey:@"commentId"];
                cm.content = [cmd objectForKey:@"content"];
                cm.postTime = [cmd objectForKey:@"postTime"];
                cm.replyNum = [cmd objectForKey:@"replyNum"];
                
                //read publisher information
                NSDictionary* userDic = [cmd objectForKey:@"user"];
                
                drUser* user = [drUser new];
                user.user_image = [userDic objectForKey:@"avatar"];
                user.user_email = [userDic objectForKey:@"email"];
                user.user_gender = [userDic objectForKey:@"gender"];
                user.telephone = [userDic objectForKey:@"telephone"];
                user.user_id = [userDic objectForKey:@"userId"];
                user.user_type = [userDic objectForKey:@"userType"];
                user.user_name = [userDic objectForKey:@"username"];
                
                
                cm.publisher = user;
                
                [commentsData addObject:cm];
            }
            
            [self.delegate getMoreCommentsFinished:commentsData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getMoreCommentsFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getMoreCommentsFailed:error];
    }];
    [request startAsynchronous];
    
}

-(void) applyForEvent:(drEvent*)model by:(drUser*)user{
    //applyFor.action?event_id=x&name=x&telephone=x&email=x
    NSString *str;
    
    str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/pubComment.action"];
    
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:user.user_name forKey:@"name"];
    [request setPostValue:user.telephone forKey:@"telephone"];
    [request setPostValue:user.user_email forKey:@"email"];
    [request setPostValue:model.event_id forKey:@"event_id"];
    
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
            [self.delegate applyForEventFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate applyForEventFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate applyForEventFailed:error];
    }];
    [request startAsynchronous];
    
}

//该方法只取参数model中的EventID作为lastId
-(void) getAllMyPubEvents:(drEvent*)model{
    //getAllApplyDetails.action?apply_detail_id=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getAllApplyDetails.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    if(model.event_id>0)
        [request setPostValue:model.event_id forKey:@"apply_detail_id"];
    
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
            [self.delegate getAllMyPubEventsFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getAllMyPubEventsFailed: err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getAllMyPubEventsFailed:error];
    }];
    [request startAsynchronous];
}

-(void) getAllMyAttEvents:(drEvent*)model{
    //getAllApplys.action?apply_id=x
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getAllApplys.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    if(model.event_id>0)
        [request setPostValue:model.event_id forKey:@"apply_id"];
    
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
            [self.delegate getAllMyAttEventsFinished:listData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getAllMyAttEventsFailed: err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getAllMyAttEventsFailed:error];
    }];
    [request startAsynchronous];
    
}

-(void) useTicket:(drEvent*)model code:(NSString*)code{
    //confirmApply?event_id=x&code=x
    
    NSString *str;
    
    str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/confirmApply"];
    
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:code forKey:@"code"];
    [request setPostValue:model.event_id forKey:@"event_id"];
    
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
            [self.delegate useTicketFinished];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSString* message = [resDict objectForKey:@"error_message"];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate useTicketFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate  useTicketFailed:error];
    }];
    [request startAsynchronous];
}

-(void) getAllParticipator:(drEvent*)model{
    //getAllApplyUsers.action?apply_detail_id=x
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",HOST_NAME,@"json/getAllApplyUsers.action"];
    NSURL *url = [NSURL URLWithString:[str URLEncodedString]];
    NSLog(@"url-->%@",[url description]);
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setPostValue:model.event_id forKey:@"apply_detail_id"];
    
    drAppDelegate *myDelegate0 = [[UIApplication sharedApplication] delegate];
    [request setUseCookiePersistence:NO];
    [request setRequestCookies:[NSMutableArray arrayWithObject:myDelegate0.cookie]];
    
    [request setCompletionBlock:^{
        
        NSData *data  = [request responseData];
        NSLog(@"response-->%@\n",[data description]);
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"error_type"];
        if ([resultCodeNumber integerValue] == 0)
        {
            //here read in the comments
            NSMutableArray*  userDics = [resDict objectForKey:@"applys"];
            
            NSMutableArray* usersData = [NSMutableArray new];
            
            for (NSDictionary* userDic in userDics) {
                drUser *user =[drUser new];
                
                user.user_image = [userDic objectForKey:@"avatar"];
                user.user_email = [userDic objectForKey:@"email"];
                user.user_gender = [userDic objectForKey:@"gender"];
                user.telephone = [userDic objectForKey:@"telephone"];
                user.user_id = [userDic objectForKey:@"userId"];
                user.user_type = [userDic objectForKey:@"userType"];
                user.user_name = [userDic objectForKey:@"username"];
                
                [usersData addObject:user];
            }
            [self.delegate getAllParticipatorFinished:usersData];
        } else {
            NSInteger resultCode = [resultCodeNumber integerValue];
            NSNumber *resultCodeNumber = [NSNumber numberWithInt:resultCode];
            NSString* message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message
                                                                 forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate getAllParticipatorFailed:err];
        }
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        [self.delegate getAllParticipatorFailed:error];
    }];
    [request startAsynchronous];
}
@end
