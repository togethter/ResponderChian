//
//  ViewController.m
//  ResponderChian
//
//  Created by 李学良 on  2021/3/18.
//

#import "ShopDetailController.h"
#import "CustomLikeView.h"
#import "CustomCollectionView.h"

@interface ShopDetailController ()
@property (nonatomic, strong) ShopEventProxy *eventProxy;
@property (nonatomic, strong) CustomCollectionView *customCollectionView;
@property (nonatomic, strong) CustomLikeView *customLikeView;
@end

@implementation ShopDetailController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.customCollectionView];
    [self.view addSubview:self.customLikeView];
    
}


#pragma mark - event response

- (void)likeEvent:(NSDictionary *)info {
    NSLog(@"%s\n%@",__FUNCTION__,info);
}
- (void)collectionEvent:(NSDictionary *)info {
    NSLog(@"%s\n%@",__FUNCTION__,info);
    
}


#pragma mark - override methods

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {

    [self.eventProxy handleEvent:eventName userInfo:userInfo];
//       如果需要让事件继续往上传递，则调用下面的语句
//       [super routerEventWithName:eventName userInfo:userInfo];
    
}

#pragma mark - getters and setters

- (ShopEventProxy *)eventProxy {
    if (_eventProxy == nil) {
        ShopEventProxy *proxy = [ShopEventProxy eventProxyTarget:self];
        _eventProxy = proxy;
    }
    return _eventProxy;
}

- (CustomCollectionView *)customCollectionView {
    if (_customCollectionView == nil) {
        CustomCollectionView * view = [[CustomCollectionView alloc] init];
        view.frame = CGRectMake(0, 100, 100, 100);
        view.backgroundColor = [UIColor systemPinkColor];
        _customCollectionView = view;
    }
    return _customCollectionView;
}

- (CustomLikeView *)customLikeView {
    if (_customLikeView == nil) {
        CustomLikeView *view = [[CustomLikeView alloc] init];
        view.frame = CGRectMake(100, 100, 100, 100);
        view.backgroundColor = [UIColor darkGrayColor];
        _customLikeView =  view;
    }
    return _customLikeView;
}


@end
