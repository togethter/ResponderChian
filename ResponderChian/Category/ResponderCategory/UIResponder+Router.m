//
//  UIResponder+Router.m
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
/**
 view/ViewController... : UIResponder
 isa -> class(分类中的方法在运行时动态添加到类方法列表中最前面) -> superclass ... -> UIResponder ... -> nil
 */
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
