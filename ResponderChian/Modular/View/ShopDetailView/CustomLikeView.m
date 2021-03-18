//
//  CustomLikeView.m
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import "CustomLikeView.h"

@interface CustomLikeView ()
@property (nonatomic, strong) UIButton *likeButton;
- (NSString *)__eventName;
@end

@implementation CustomLikeView

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.likeButton];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.likeButton.frame = self.bounds;
}

#pragma mark - event
- (void)likeClick:(UIButton *)button {
    [self routerEventWithName:self.__eventName userInfo:@{
        @"class":NSStringFromClass(self.class),
        @"event":self.__eventName,
        @"target":self
    }];
    
}

#pragma mark - private method

- (NSString *)__eventName {
    return XLLikeEvent;
}



#pragma mark - getters and setters
- (UIButton *)likeButton {
    if (!_likeButton) {
        UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [likeButton addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
        [likeButton setTitle:@"click" forState:UIControlStateNormal];
        _likeButton = likeButton;
    }
    return _likeButton;
}

@end
