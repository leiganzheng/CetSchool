//
//  DataMannagerCenter.h
//  QooccHealth
//
//  Created by leiganzheng on 14-8-12.
//  Copyright (c) 2014年 leiganzheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define serverIP @"http://192.168.6.131:7080"//内网
//#define serverIP @"http://61.145.174.98:7080"//外网
//#define serverIP @"http://192.168.6.96:8090"
//#define serverIP @"http://192.168.20.133:7080"
#define serverIP @"http://xite.qoocc.com/dc"
//应用在appstore上的信息
#define kAPP_URL   @"http://itunes.apple.com/lookup?id=954195901"//应用程序的ID 是itunes connect的 Apple ID

typedef enum {
    kHeartRate = 0,//脉率
    kHeartMeter = 1,//心电图
    kBloodPressure = 2,//血压
    kBloodOxygen = 3,//血氧
    kBreathingRate = 4,//呼吸率
    kTemperature = 5,//体温
    kPissCheck = 6,//尿检
    kHealthRate = 7//健康评分
} CheckHistoryType;

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

@end



