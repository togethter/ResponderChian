# ResponderChian用于处理复杂布局中消息传递

# UIResponder响应者传递
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo

# 继承响应者的字类重写响应者方法，可以选择是否向上传递
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo

# NSInvocation 消息转发解耦合
