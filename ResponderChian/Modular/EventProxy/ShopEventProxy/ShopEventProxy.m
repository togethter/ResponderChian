//
//  ShopEventProxy.m
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import "ShopEventProxy.h"
#import <objc/runtime.h>
@interface ShopEventProxy ()
@property (nonatomic, weak) id target;
@property (nonatomic, strong) NSDictionary *eventStrategy;


@end
@implementation ShopEventProxy
#pragma mark - life cycle
+ (instancetype)eventProxyTarget:(id)target
{
    ShopEventProxy *ShopEventProxy = [[[self class] alloc] init];
    ShopEventProxy.target = target;
    return ShopEventProxy;
}

#pragma mark - handleEvent

- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    // 通过eventName找到方法
    NSInvocation *invocation = self.eventStrategy[eventName];
    invocation.target = self.target;
    [invocation setArgument:&userInfo atIndex:2];
    // 消息转发
    [invocation invoke];
}



#pragma mark - private methods

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *methodSig = [NSMethodSignature signatureWithObjCTypes:"@::"];    
    return methodSig;
}

- (NSInvocation *)createInvocationWithSelector:(SEL)sel {
    NSMethodSignature *methodSig = [NSMethodSignature  signatureWithObjCTypes:"v@::"];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    invocation.selector = sel;
    return invocation;
}


#pragma mark - getter and setters

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy
{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
            // 点在事件
            XLLikeEvent:[self createInvocationWithSelector:NSSelectorFromString(@"likeEvent:")],
            XLCollectionEvent:[self createInvocationWithSelector:NSSelectorFromString(@"collectionEvent:")]

            // todo something....
                               
        };
    }
    return _eventStrategy;
}
@end
