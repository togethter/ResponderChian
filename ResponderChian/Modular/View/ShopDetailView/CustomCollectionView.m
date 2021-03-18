//
//  CustomCollectionView.m
//  ResponderChianDebug
//
//  Created by 李学良 on 2021/3/16.
//

#import "CustomCollectionView.h"

@interface CustomCollectionView ()
@property (nonatomic, strong) UIButton *collectionButton;
- (NSString *)__eventName;
@end
@implementation CustomCollectionView

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.collectionButton];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionButton.frame = self.bounds;
}

#pragma mark - event
- (void)collectionClick:(UIButton *)button {
    [self routerEventWithName:self.__eventName userInfo:@{
        @"class":NSStringFromClass(self.class),
        @"event":self.__eventName,
        @"target":self
    }];
    
}

#pragma mark - private method

- (NSString *)__eventName {
    return XLCollectionEvent;
}

#pragma mark - getters and setters
- (UIButton *)collectionButton {
    if (_collectionButton == nil) {
        UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
        [sender addTarget:self action:@selector(collectionClick:) forControlEvents:UIControlEventTouchUpInside];    
        [sender setTitle:@"click" forState:UIControlStateNormal];
        _collectionButton = sender;
    }
    return _collectionButton;
}

@end
