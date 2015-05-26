//
//  DataMannagerCenter.h
//  QooccHealth
//
//  Created by leiganzheng on 14-8-12.
//  Copyright (c) 2014年 leiganzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define serverIP @"http://www.xuetian.cn/api/apiservice.aspx"

/**
 获取数据的 block 回调
 @param error 错误信息 obj为字典类型
 */
typedef void(^DataMannagerCenterFinishBlock)(id error, id obj);
/**
 *  逻辑和网络控制中心
 */
@interface DataMannagerCenter : NSObject
+ (instancetype)sharedInstance;
+ (void)destroy;
/**
 *  登录
 *
 *  @param userID   账户ID
 *  @param password 密码
 *  @param block    回调
 */
- (void)loginWith:(NSString *)userID And:(NSString *)password Finish:(DataMannagerCenterFinishBlock)block;
/**
 *  登出
 *
 *  @param openId 登录接口返回
 *  @param blok   回调
 */
- (void)logoutWithOpenId:(NSString *)openId Finish:(DataMannagerCenterFinishBlock)blok;
/**
 *  用户注册
 *
 *  @param name     姓名
 *  @param passWord 密码
 *  @param block    回调
 */
- (void)registerWithName:(NSString *)name passWord:(NSString *)passWord Finish:(DataMannagerCenterFinishBlock)block;
/**
 *  修改密码
 *
 *  @param openId 登录接口返回
 *  @param old    旧密码
 *  @param newPw  新密码
 *  @param conPw  确认密码
 *  @param block  回调
 */
- (void)userChangePasswordWithOpenId:(NSString *)openId withOldPW:(NSString *)old newPW:(NSString *)newPw confirmPW:(NSString *)conPw Finish:(DataMannagerCenterFinishBlock)block;
/**
 *  用户提交反馈
 *
 *  @param openId  登录接口返回
 *  @param context 反馈内容
 *  @param page    反馈页面
 *  @param contact 联系方式
 *  @param block   回调
 */
- (void)userPutFeedBackWithOpenId:(NSString *)openId context:(NSString *)context backPage:(NSString *)page contact:(NSString *)contact Finish:(DataMannagerCenterFinishBlock)block;
/**
 *  用户获取个人信息
 *
 *  @param block 回调
 */
- (void)getUserInfoFinish:(DataMannagerCenterFinishBlock)block;
/**
 *  用户修改个人信息
 *
 *  @param img    图像base64编码(可选)
 *  @param name   昵称
 *  @param sex    性别
 *  @param mobile 手机
 *  @param block  回调
 */
- (void)userChangeUserInfoWithHeadImage:(NSString *)img name:(NSString *)name sex:(NSString *)sex mobile:(NSString *)mobile Finish:(DataMannagerCenterFinishBlock)block;
@end



