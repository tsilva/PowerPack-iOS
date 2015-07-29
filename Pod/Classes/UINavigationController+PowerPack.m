#import "UINavigationController+PowerPack.h"

@implementation UINavigationController(PowerPack)

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion {
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

- (void)popViewControllerAnimated:(BOOL)animated
                       completion:(void (^)(void))completion {
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

@end
