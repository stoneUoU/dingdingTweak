//
//  YLZLocationManager.m
//  HSA-UnionApp-iOS
//
//  Created by stone on 2020/6/15.
//

#import "YLZLocationManager.h"

@interface YLZLocationManager()

@end

@implementation YLZLocationManager

static YLZLocationManager * _shareInstance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[super allocWithZone:NULL] init];
    });
    return _shareInstance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [YLZLocationManager shareInstance];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone {
    return [YLZLocationManager shareInstance];
}


@end


