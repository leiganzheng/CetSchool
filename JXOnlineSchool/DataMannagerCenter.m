//
//  DataMannagerCenter.m
//  QooccHealth
//
//  Created by leiganzheng on 14-8-12.
//  Copyright (c) 2014年 leiganzheng. All rights reserved.
//

#import "DataMannagerCenter.h"

@implementation DataMannagerCenter
+ (instancetype)sharedInstance {
    static DataMannagerCenter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    });
    return sharedInstance;
}

+ (void)destroy{
    
}

- (id)init {
    self = [super init];
    if (self) {
       
    }
    return self;
}
//登录 、 登出、注册
- (void)loginWith:(NSString *)userID And:(NSString *)password Finish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"UserName":@"ceshi", @"Password": @"123456",@"AppType":@"2"};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.Login"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];

}
- (void)logoutWithOpenId:(NSString *)openId Finish:(DataMannagerCenterFinishBlock)blok{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"OpenId":openId};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.LogOut"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];

}
- (void)registerWithName:(NSString *)name passWord:(NSString *)passWord Finish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"UserName":name, @"Password": passWord,@"AppType":@"2"};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.Register"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];
}
//用户中心接口
- (void)userChangePasswordWithOpenId:(NSString *)openId withOldPW:(NSString *)old newPW:(NSString *)newPw confirmPW:(NSString *)conPw Finish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"OpenId":openId, @"OldPassword": old,@"Password": newPw,@"ConfirmPassword": conPw};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.ChangePassword"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];
}
- (void)userPutFeedBackWithOpenId:(NSString *)openId context:(NSString *)context backPage:(NSString *)page contact:(NSString *)contact Finish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"OpenId":openId, @"FeedBackContext": context,@"FeeedBackPage": page,@"Contact": contact,@"AppType":@"2"};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.PutFeedBack"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];

}
- (void)getUserInfoFinish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"OpenId":@""};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.GetUserInfo"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];

}
- (void)userChangeUserInfoWithHeadImage:(NSString *)img name:(NSString *)name sex:(NSString *)sex mobile:(NSString *)mobile Finish:(DataMannagerCenterFinishBlock)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"OpenId":@"", @"HeadImageUrl": img,@"NickName": name,@"Mobile": mobile,@"Sex": sex};
    NSString *data = [self toJSONData:dict];
    if (!data) {
        return;
    }
    [manager GET:[serverIP stringByAppendingString:@"/Users.ChangeUserInfo"] parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
    }];

}
#pragma mark -private method
- (NSString *)toJSONData:(id)theData{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }else{
        return @"";
    }
}


@end
