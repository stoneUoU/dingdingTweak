//
//  YLZLocationManager.h
//  HSA-UnionApp-iOS
//
//  Created by stone on 2020/6/15.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZLocationManager : NSObject

//地理位置：
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

//记录插件是否打开的开关：
@property (nonatomic, assign) BOOL isOpen;

+ (instancetype)shareInstance;


@end

NS_ASSUME_NONNULL_END
