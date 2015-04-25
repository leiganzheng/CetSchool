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


@end
