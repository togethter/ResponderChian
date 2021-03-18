//
//  EventProxy.h
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShopEventProxy : NSObject
+ (instancetype)eventProxyTarget:(id)target;
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end

NS_ASSUME_NONNULL_END
