//
//  UIResponder+Router.h
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Router)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end

NS_ASSUME_NONNULL_END
