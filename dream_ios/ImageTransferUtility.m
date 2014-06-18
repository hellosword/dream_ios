//
//  ImageTransferUtility.m
//  dream_ios
//
//  Created by hellosword on 14-6-14.
//  Copyright (c) 2014年 hellosword. All rights reserved.
//

#import "ImageTransferUtility.h"

@implementation ImageTransferUtility
-(void)requestFinished: (ASIHTTPRequest *)request
{
    NSData *data = [request responseData];
    NSError *err;
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if(!resDict){
        [_delegate getImageListItemFinished:data imgIndex:request.tag];
    }else{
        [_delegate getImageListItemFailed:err imgIndex:request.tag];
    }
    if([_networkQueue requestsCount]==0){
        [self setNetworkQueue:nil];
    }
}
-(void)requestFailed: (ASIHTTPRequest *)request
{
    NSError *err = [request error];
    if([_networkQueue requestsCount]==0){
        [self setNetworkQueue:nil];
    }
    [_delegate getImageListItemFailed:err imgIndex:request.tag];
}
-(void)queueFinished:(ASIHTTPRequest *)request
{
    if([_networkQueue requestsCount]==0){
        [self setNetworkQueue:nil];
    }
    [_delegate getImageListFinished:0];
}
-(void) startImageListQuery:(NSMutableArray *)urllist
{
    if(!_networkQueue){
        _networkQueue = [[ASINetworkQueue alloc] init];
    }
    [_networkQueue cancelAllOperations];
    
    [_networkQueue setDelegate:self];
    [_networkQueue setRequestDidFinishSelector:@selector(requestFinished:)];
    [_networkQueue setRequestDidFailSelector:@selector(requestFailed:)];
    [_networkQueue setQueueDidFinishSelector:@selector(queueFinished:)];
    
    for(int i=0;i<urllist.count;i++){
        NSString *strURL = [urllist objectAtIndex:i];
        NSURL *url = [NSURL URLWithString:[strURL URLEncodedString]];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        request.tag = i;
        [_networkQueue addOperation:request];
    }
    [_networkQueue go]; 
}
@end
